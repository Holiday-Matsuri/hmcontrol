class Guest < ApplicationRecord
  extend FriendlyId
  friendly_id :guest_name, use: :slugged
  belongs_to :convention
end
