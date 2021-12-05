class Api::ConventionsController < ApplicationController
  def show
    @convention = Convention.active.first
  end
  def convention_updated
    @convention = Convention.active.first
    d = DateTime.parse(params[:date])
    @updated = []
    if @convention.con_updated?(params[:date]) == true
      if @convention.events_updated?(params[:date]) != nil
        @updated.push("events")
      end
      if @convention.vendors_updated?(params[:date]) != nil
        @updated.push("vendors")
      end
      if @convention.artists_updated?(params[:date]) != nil
        @updated.push("artists")
      end
      if @convention.guests_updated?(params[:date]) != nil
        @updated.push("guests")
      end
      render json: {isUpdated: true, toUpdate: @updated, updateDate: DateTime.now.strftime("%Y-%m-%d %k:%M %:z")}
    else
      render json: {isUpdated: false}
    end
  end
  
end