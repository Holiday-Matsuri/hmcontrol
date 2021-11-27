class Api::VendorsController < ApplicationController
  def index
    @vendors = Vendor.where(convention_id: params[:convention_id])
  end
end