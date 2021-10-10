class Admin::EventsController < Admin::AdminController
  before_action :set_event
  def index
    @events = Event.where(convention_id: @convention.id)
  end

  def new
    @event = Event.new
    @apps = EventApplication.joins(:reviews).distinct.where(convention_id: @convention.id).reviewing.references(:reviews)
  end
  
  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end