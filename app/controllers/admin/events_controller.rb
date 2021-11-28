class Admin::EventsController < Admin::AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_admin, only: [:new, :create, :edit, :update]
  def index
    @events = Event.where(convention_id: @convention.id)
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @convention.update(updated_at: DateTime.now)
    if @event.save
      @event.convention_id = @convention.id
      flash[:success] = "Event #{@event.event_name} has been scheduled"
      redirect_to new_admin_event_path
    else
      flash[:danger] = "Error Saving Event"
      render :new
    end
  end

  def show
    # show action 
  end

  def edit
    # edit action
  end

  def update
    @event.update(event_params)
    @event.convention.update(updated_at: DateTime.now)
    if @event.save
      flash[:success] = "Event Updated Successfully"
      redirect_to admin_event_path(@event)
    else
      flash[:danger] = "Error"
      render :update
    end
  end

  def destroy
    @convention.update(updated_at: DateTime.now)
    @event.delete
    redirect_to admin_events_path
  end
  private
  def set_admin
    @admins = AdminUser.all
  end
  
  def set_event
    @event = Event.friendly.find(params[:id])
  end
  def event_params
    params.require(:event).permit(
      :event_name,
      :start_datetime,
      :end_datetime,
      :external_desc,
      :age_rating,
      :location,
      :host,
      :user_id,
      :convention_id
    )
  end
  
  
end