class Admin::ApplicationReviewsController < Admin::AdminController
  before_action :authenticate_staff
  def index
    
  end

  def new
    @review = ApplicationReview.new
    @panel = EventApplication.submitted.where('review_count < 5 AND review_lock = false').limit(1).order("RANDOM()").first
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
  
  
  
end
