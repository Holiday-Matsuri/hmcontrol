class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  protected
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
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

  def set_active_convention!
    @convention = Convention.active.first
  end
  
  
  
end
