class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.where(convention_id: params[:convention_id])
  end
end