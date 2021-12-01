class Api::GuestsController < ApplicationController
  before_action :set_active_convention!
  def index
    @guests = Guest.where(convention_id: @convention.id).group_by(&:guest_category)
  end
end