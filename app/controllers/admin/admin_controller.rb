class Admin::AdminController < ApplicationController
  before_action :authenticate_staff
  before_action :set_active_convention!
  layout 'admin'
  def index
    
  end
  
end