class EventApplication < ApplicationRecord
  belongs_to :user
  belongs_to :convention
  has_many :application_reviews
end
