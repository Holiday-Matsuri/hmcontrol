class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_active_convention!
  def index
    
  end
  
  def update
    @user.update(profile_params)
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Account deleted"
  end
  
  private

  def set_user
    @user = current_user
  end
  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
  
  
  
end