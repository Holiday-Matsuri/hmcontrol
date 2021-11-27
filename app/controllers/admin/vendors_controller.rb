class Admin::VendorsController < Admin::AdminController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  def index
    @vendors = Vendor.where(convention_id: @convention.id)
  end

  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(event_params)
    if @vendor.save
      flash[:success] = "Vendor #{@vendor.vendor_name} has been added"
      redirect_to new_admin_vendor_path
    else
      flash[:danger] = "Error Saving vendor"
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
    @vendor.update(vendor_params)
    if @vendor.save
      flash[:success] = "Vendor Updated Successfully"
      redirect_to admin_vendor_path(@vendor)
    else
      flash[:danger] = "Error"
      render :update
    end
  end

  def destroy
    @vendor.delete
  end
  private
  def set_vendor
    @vendor = Vendor.find(params[:id])
  end
  
end