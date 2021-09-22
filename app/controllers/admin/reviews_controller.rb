class Admin::ReviewsController < Admin::AdminController
  before_action :authenticate_staff
  def index
    @total_panels = EventApplication.where(convention_id: @convention.id).count
    @reviewed_panels = EventApplication.joins(:reviews).distinct.where(convention_id: @convention.id).submitted.references(:reviews)
    @not_reviewed = EventApplication.includes(:reviews).where(convention_id: @convention.id, reviews: { event_application_id: nil })
  end

  def new
    @review = Review.new
    @panel = EventApplication.submitted.where('review_count < 5 AND review_lock = false').where.not(id: Review.where(user_id: current_user.id)).limit(1).order("RANDOM()").first
    @count = EventApplication.where(panel_category: @panel.panel_category).count
    @total = EventApplication.where(convention_id: @convention.id).count
    @rarity = rarity(@count, @total)
    # @panel.review_lock = true
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      EventApplication.find(@review.event_application_id).increment!(:review_count)
      flash[:notice] = "Review for #{@review.event_application.event_name} saved!"
      redirect_to new_admin_review_path
    else
      flash[:notice] = "ERR"
      render :new
    end
  end
  
  

  def show
    if current_user.type == "AdminUser"
      @panel = EventApplication.joins(:reviews).friendly.find(params[:id])
    else
      @panel = EventApplication.friendly.find(params[:id])
      @review = @panel.reviews.where(user_id: current_user.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :feasibility,
      :relevance,
      :structure,
      :fun_factor,
      :style,
      :comments,
      :total_score,
      :user_id,
      :event_application_id
    )
  end

  def rarity(count, total)
    percent = (count.to_f / total).to_f
    y = 100 - ((percent))*100
    y.floor
  end
  
  
  
end
