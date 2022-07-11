class Admin::ConventionsController < Admin::AdminController
  before_action :set_convention, only: [:show, :edit, :update, :archive]
  skip_before_action :set_active_convention!
  def index
    @conventions = Convention.all
  end

  def new
    @convention = Convention.new
  end

  def create
    @convention = Convention.new(convention_params)
    if @convention.save
      flash[:success] = "Convention Added"
      redirect_to admin_conventions_path
    else
      flash[:danger] = "ERROR Convention Not Saved"
      render :new
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  

  def update
    @convention.update(convention_params)
    if @convention.save
      flash[:success] = "Convention Updated"
      redirect_to admin_conventions_path
    else
      flash[:danger] = "ERROR Convention not saved"
      render :update
    end
  end
  
  def destroy
    @convention.update(status: 1)
    redirect_to admin_conventions_path
  end
  
  def active
    Convention.where(status: "active").each do |con|
      con.update(status: 'inactive')
    end
    @convention.update(status: 'active')
  end
  
  def archive
    if @convention.status == "inactive"
      @convention.update(status: 'archived')
      flash[:success] = "Convention Archived"
      redirect_to admin_conventions_path
    else
      flash[:warning] = "Convention not updated"
      redirect_to admin_conventions_path
    end
  end

  private
  def set_convention
    @convention = Convention.friendly.find(params[:id])
  end

  def convention_params
    params.require(:convention).permit(:year, :address, :description, :start_date, :end_date, :status, :panel_soft_cap)
  end
  
  
end