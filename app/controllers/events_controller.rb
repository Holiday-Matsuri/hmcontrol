class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @events = Event.all
  end

  def show
    @event = Event.friendly.find(params[:id])    
  end
  
  
end
