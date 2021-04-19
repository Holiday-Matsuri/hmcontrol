class ApplicationController < ActionController::Base
  protected
  def authenticate_staff
    authenticate_user!
    if current_user.type != "AdminUser" || current_user.type != "StaffUser"
      flash[:alert] = "You are not Authorized to View this Page."
      redirect_to :back
    end
  end

  def authenticate_admin
    authenticate_user!
    if current_user.type != "AdminUser"
      flash[:alert] = "You are not Authorized to View this Page."
      redirect_to :back
    end
  end
  
  
end
