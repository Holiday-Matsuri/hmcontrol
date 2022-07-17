class EventApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_convention
  before_action :set_panel, only: [:show, :edit, :update, :destroy]
  before_action :check_panel_count

  def index
    @submitted = EventApplication.submitted.where(user_id: current_user.id, convention_id: @convention.id)
    @approved = EventApplication.approved.where(user_id: current_user.id, convention_id: @convention.id)
    @reviewed = EventApplication.reviewing.where(user_id: current_user.id, convention_id: @convention.id)
    @ready = EventApplication.ready.where(user_id: current_user.id, convention_id: @convention.id)
    @scheduled = EventApplication.scheduled.where(user_id: current_user.id, convention_id: @convention.id)
    @waitlist = EventApplication.waitlist.where(user_id: current_user.id, convention_id: @convention.id)
  end

  def new
    @panel = EventApplication.new

  end

  def create
    @panel = EventApplication.new(panel_params)
    if Date.today > @convention.panel_hard_cap_date
      @panel.update(application_status: 'waitlist')
    else
      @panel.update(application_status: 'submitted')
    end
    if @panel.save
      EventApplicationMailer.created_event_application(@panel, current_user).deliver
      @convention.panel_cap_check(EventApplication.where(convention_id: @convention.id).count)
      redirect_to root_path, notice: 'Panel was successfully created.'
    else
      
      render :new, notice: 'There was an error, please retry.'
    end
  end

  def show
    authorize! :read, @panel
  end
  

  def edit
    if Date.today >= @convention.panel_hard_cap_date + 24.hours && @panel.submitted? && current_user.type != "AdminUser"
      redirect_to root_path, notice: 'Your panel has been submitted for review and can no longer be edited'
    end
    authorize! :edit, @panel
  end

  def update
    if @panel.update(panel_params)
      redirect_to convention_event_application_path(@convention, @panel), notice: 'Panel was successfully updated.'
    else
      render :edit, notice: 'There was an error, please retry.'
    end
  end
  def destroy
    authorize! :destroy, @panel
    @panel.destroy
  end
  
  
  

  private

  def check_panel_count
    count = EventApplication.where(convention_id: @convention.id).count
    if count >= @convention.panel_soft_cap.to_i
      if Date.today >= @convention.panel_hard_cap_date + 24.hours
        @lockout = true
      else
        @lockout = false
      end
    end
  end
  
  def set_panel
    @panel = EventApplication.friendly.find(params[:id])
  end
  

  def set_convention
    @convention = Convention.where(status: 'active').first
  end

  def panel_params
    params.require(:event_application).permit(
      :event_name,
      :external_desc,
      :event_length,
      :internal_desc,
      :host_stage_name,
      :age_rating,
      :agreed_to_terms,
      :friday_best_choice,
      :saturday_best_choice,
      :sunday_best_choice,
      :previous_convention,
      :panel_category,
      :user_id,
      :convention_id,
      time_choice_attributes: [
        :fri_8_to_11,
        :fri_11_to_14,
        :fri_14_to_17,
        :fri_17_to_20,
        :fri_20_to_23,
        :fri_23_to_2,
        :sat_8_to_11,
        :sat_11_to_14,
        :sat_14_to_17,
        :sat_17_to_20,
        :sat_20_to_23,
        :sat_23_to_2,
        :sun_8_to_11,
        :sun_11_to_14,
        :sun_14_to_17
      ]
      
    )
  end
  
  
  
  
end
