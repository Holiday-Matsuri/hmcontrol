class Api::VendorsController < ApplicationController
  before_action :set_active_convention!
  def index
    @vendors = Vendor.where(convention_id: @convention.id).order(Vendor.arel_table['vendor_name'].lower.asc).group_by{|u| u.vendor_name[0].upcase}
  end
end