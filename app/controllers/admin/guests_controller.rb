class Admin::GuestsController < Admin::AdminController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  def index
    @guests = Guest.where(convention_id: @convention.id)
  end

  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(guest_params)
    @guest.convention = @convention
    if @guest.save
      flash[:success] = "Guest #{@guest.guest_name} has been added"
      redirect_to new_admin_guest_path
    else
      flash[:danger] = "Error Saving Guest"
      render :new
    end
  end

  def show
    # show action 
  end

  def edit
    # edit action
  end

  def update
    @guest.update(guest_params)
    if @guest.save
      flash[:success] = "Guest Updated Successfully"
      redirect_to admin_guest_path(@guest)
    else
      flash[:danger] = "Error"
      render :update
    end
  end

  def destroy
    @guest.delete
  end
  private
  def set_guest
    @guest = Guest.find(params[:id])
  end
  def guest_params
    params.require(:guest).permit(
      :guest_name,
      :guest_description
    )
  end
  

end