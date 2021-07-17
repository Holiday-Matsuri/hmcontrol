class EventApplication < ApplicationRecord
  extend FriendlyId
  friendly_id :event_name, use: :slugged
  belongs_to :user
  belongs_to :convention
  has_many :application_reviews
  has_one :time_choice, dependent: :destroy
  accepts_nested_attributes_for :time_choice, allow_destroy: true
  enum application_status: [:submitted, :approved, :rejected, :scheduled, :waitlist]
  validates_presence_of :event_name
  validates_presence_of :event_length
  validates_presence_of :internal_desc
  validates_presence_of :external_desc
  validates_presence_of :host_stage_name
  validates_uniqueness_of :event_name


  scope :submitted, -> { where(:application_status => "submitted")}
  scope :approved, -> { where(:application_status => "approved")}
  scope :rejected, -> { where(:application_status => "rejected")}
  scope :scheduled, -> { where(:application_status => "scheduled")}
  scope :waitlist, -> { where(:application_status => "waitlist")}
  
  
end
