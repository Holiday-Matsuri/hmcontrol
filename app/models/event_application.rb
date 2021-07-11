class EventApplication < ApplicationRecord
  extend FriendlyId
  friendly_id :event_name, use: :slugged
  belongs_to :user
  belongs_to :convention
  has_many :application_reviews
  has_one :time_choice, dependent: :destroy
  accepts_nested_attributes_for :time_choice, allow_destroy: true
  enum application_status: [:submitted, :approved, :rejected, :scheduled, :waitlist]

  scope :submitted, -> { where(:application_status => "submitted")}
  scope :approved, -> { where(:application_status => "approved")}
  scope :rejected, -> { where(:application_status => "rejected")}
  scope :scheduled, -> { where(:application_status => "scheduled")}
  scope :waitlist, -> { where(:application_status => "waitlist")}
  
  
end
