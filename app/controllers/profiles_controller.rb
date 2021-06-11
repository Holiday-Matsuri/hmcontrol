class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_active_convention!
  def index
    
  end
  
  def update
    @user.update(profile_params)
  end
  private

  def set_user
    @user = current_user
  end
  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :email)
  end
  
  
  
end