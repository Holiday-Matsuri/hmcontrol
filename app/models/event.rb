class Event < ApplicationRecord
  belongs_to :convention
  belongs_to :user
  extend FriendlyId
  friendly_id :event_name, use: :slugged
  enum status: [:submitted, :approved, :rejected, :scheduled, :waitlist]
end
