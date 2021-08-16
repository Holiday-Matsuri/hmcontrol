class Admin::ApplicationsController < Admin::AdminController
  before_action :set_convention
  def index
    @panels = EventApplication.where(convention_id: @convention.id)
  end
  def show
    @panel = EventApplication.friendly.find(params[:id])
  end
  

  private

  def set_convention
    @convention = Convention.active.first
  end
  
  
end