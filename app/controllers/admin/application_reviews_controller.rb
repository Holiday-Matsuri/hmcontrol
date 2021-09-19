class Admin::ApplicationReviewsController < Admin::AdminController
  before_action :authenticate_staff
  def index
    
  end

  def new
    @review = ApplicationReview.new
    @panel = EventApplication.submitted.where('review_count < 5 AND review_lock = false').not_reviewed_yet(@current_user).limit(1).order("RANDOM()").first
    @count = EventApplication.where(panel_category: @panel.panel_category).count
    @total = EventApplication.where(convention_id: @convention.id).count
    @rarity = rarity(@count, @total)
    # @panel.review_lock = true
  end

  def create
    @review = ApplicationReview.create(review_params)
  end
  
  

  def show
    
  end

  private

  def review_params
    
  end

  def rarity(count, total)
    percent = (count.to_f / total).to_f
    y = 100 - ((percent))*100
    y.floor
  end
  
  
  
end
