class Admin::SchedulingController < Admin::AdminController
  def new
    @event = Event.new
    @app = EventApplication.friendly.find(params[:application_id])
  end
  def create
    @app = EventApplication.friendly.find(params[:application_id])
    @event = Event.new(event_params)
    if @event.save
      @event.convention_id = @convention.id
      @app.update(application_status: 'scheduled')
      flash[:success] = "Event #{@event.event_name} has been scheduled"
      redirect_to admin_applications_path
    else
      flash[:danger] = "Error Saving Event"
      render :new
    end
  end
  private
  def event_params
    params.require(:event).permit(
      :event_name,
      :start_datetime,
      :end_datetime,
      :external_desc,
      :age_rating,
      :host,
      :location,
      :user_id,
      :convention_id
    )
  end
  
  
end