class EventApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_convention

  def index
    @panels = EventApplication.where(user_id: current_user.id)
  end
  def new
    @panel = EventApplication.new

  end

  def create
    @panel = EventApplication.create(panel_params)
    redirect_to root_path
  end

  def show
    @panel = EventApplication.find(params[:id])
  end
  

  def edit
    @panel = EventApplication.find(params[:id])
  end

  def update
    @panel = EventApplication.find(params[:id])
    if @panel.update(panel_params)
      redirect_to convention_event_application_path(@convention, @panel), notice: 'Panel was successfully updated.'
    else
      render :edit, notice: 'There was an error, please retry.'
    end
  end
  
  
  

  private

  def set_convention
    @convention = Convention.where(status: 'active').first
  end

  def panel_params
    params.require(:event_application).permit(
      :event_name,
      :external_desc,
      :internal_desc,
      :host_stage_name,
      :age_rating,
      :agreed_to_terms,
      :friday_best_choice,
      :saturday_best_choice,
      :sunday_best_choice,
      :previous_convention,
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
