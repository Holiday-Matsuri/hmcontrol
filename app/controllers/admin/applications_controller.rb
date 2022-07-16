class Admin::ApplicationsController < Admin::AdminController
  before_action :set_convention
  before_action :set_panel, only: [:edit, :update, :show, :destroy]
  def index
    @panels = EventApplication.where(convention_id: @convention.id).ready
  end
  def show
    
  end
  def edit
    authorize! :edit, @panel
  end
  def update
    authorize! :edit, @panel
    if @panel.update(panel_params)
      redirect_to admin_application_path(@panel), notice: 'Panel was successfully updated.'
    else
      render :edit, notice: 'There was an error, please retry.'
    end
  end
  def destroy
    authorize! :destroy, @panel
    @panel.destroy
  end
  def category
    @panel = EventApplication.where(convention_id: @convention.id, panel_category: nil).first
  end

  def category_update
    @panel = EventApplication.friendly.find(params[:id])
    @panel.update(panel_category: params[:event_application][:panel_category])
    redirect_to admin_applications_category_path, notice: 'Panel Category Updated'
  end
  
  
  
  
  

  private

  def set_convention
    @convention = Convention.active.first
  end
  def set_panel
    @panel = EventApplication.friendly.find(params[:id])
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