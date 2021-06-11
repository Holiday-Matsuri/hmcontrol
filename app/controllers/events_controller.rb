class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_active_convention!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
        
  end

  def new
    @event = Event.new
    
  end

  def create
    @event = Event.create!(event_params)
    @event.status = 'submitted'
    if @event.save
      redirect_to convention_event_path(@convnetion, @event), notice: 'Event was successfully Submitted.'
    else
      render :new, notice: 'There was an error, please retry.'
    end
  end

  def edit
    authorize! :edit, @event
  end

  def update
    authorize! :edit, @event
    if @event.update(event_params)
      redirect_to convention_event_path(@convention, @event), notice: 'Event was successfully updated.'
    else
      render :edit, notice: 'There was an error, please retry.'
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_name, :start_datetime, :end_datetime, :internal_desc, :external_desc, :convention_id, :user_id)
  end
  def set_convention
    @convention = Convention.friendly.find(params[:convention_id])
  end
  def set_event
    @event = Event.friendly.find(params[:id])
  end
  
  
  
  
  
  
  
  
end
