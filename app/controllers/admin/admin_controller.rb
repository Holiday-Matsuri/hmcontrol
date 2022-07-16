class Admin::AdminController < ApplicationController
  before_action :authenticate_staff
  before_action :set_active_convention!
  layout 'admin'
  def index
    @panels_submitted = EventApplication.where(application_status: 'submitted').or(EventApplication.where(application_status: 'reviewing')).where(convention_id: @convention.id).count
  end
  
end