class Api::EventsController < ApplicationController
  before_action :set_active_convention!
  def index
    @events = Event.where(convention_id: @convention.id).group_by_day(day_start: 2){|u| u.start_datetime}
  end
end