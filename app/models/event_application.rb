class EventApplication < ApplicationRecord
  extend FriendlyId
  friendly_id :event_name, use: :slugged
  belongs_to :user
  belongs_to :convention
  belongs_to :user
  has_one :time_choice, dependent: :destroy
  accepts_nested_attributes_for :time_choice, allow_destroy: true
  enum application_status: [:submitted, :approved, :rejected, :scheduled, :waitlist, :secondary, :reviewing]
  validates_presence_of :event_name
  validates_presence_of :event_length
  validates_presence_of :internal_desc
  validates_presence_of :external_desc
  validates_presence_of :host_stage_name
  validates_uniqueness_of :event_name
  has_many :reviews

  def set_edit_lock
    
  end

  def set_review_lock
    self.application_status = "reviewing"
  end
  def get_average_score
    if self.reviews.exists?
      a = 0.0
      self.reviews.each do |r|
        a += r.total_score.to_f
      end
      a / self.reviews.count
    else
      "Not Reviewed Yet"
    end
  end
  
  

  
  
  
end
