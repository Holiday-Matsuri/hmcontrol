class Admin::ReviewsController < Admin::AdminController
  before_action :authenticate_staff
  def index
    @total_panels = EventApplication.where(application_status: 'submitted').or(EventApplication.where(application_status: 'reviewing')).where(convention_id: @convention.id).count
    @reviewed_panels = EventApplication.joins(:reviews).distinct.where(convention_id: @convention.id).reviewing.references(:reviews)
    @not_reviewed = EventApplication.includes(:reviews).where(convention_id: @convention.id, reviews: { event_application_id: nil })
  end

  def new
    @reviewed_panels = EventApplication.includes(:reviews).where(application_status: 'submitted', convention_id: @convention.id).where(reviews: {user_id: @current_user.id})
    @review = Review.new
    @panel = EventApplication.where(application_status: 'submitted', convention_id: @convention.id).where.not(id: @reviewed_panels.map(&:id)).order('RANDOM()').first
    @panel.update(application_status: 'reviewing')
    @count = EventApplication.where(panel_category: @panel.panel_category, convention_id: @convention.id).count
    @total = EventApplication.where(convention_id: @convention.id).count
    @rarity = rarity(@count, @total)
    # @panel.review_lock = true
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @app = EventApplication.find(@review.event_application_id)
      @app.increment!(:review_count)
      if @app.review_count == 5
        @app.update(application_status: 'ready')
      else
        @app.update(application_status: 'submitted')
      end
      flash[:notice] = "Review for #{@review.event_application.event_name} saved!"
      redirect_to admin_reviews_path
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

  def cancel_review
    @app = EventApplication.where(id: params[:app_id])
    @app.update(application_status: 'submitted')
    redirect_to admin_reviews_path
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
    100-(10*(count - 1))
  end
  
  
  
end
