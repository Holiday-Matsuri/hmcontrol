class EventApplication < ApplicationRecord
  belongs_to :user
  belongs_to :convention
  has_many :application_reviews
  has_one :time_choice
  accepts_nested_attributes_for :time_choice, allow_destroy: true
  
end
