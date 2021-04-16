class Convention < ApplicationRecord
  extend FriendlyId
  friendly_id :convention_title, use: :slugged
  enum status: [:hidden, :active]

  def convention_title
    "holiday-matsuri-#{year.to_s}"
  end
  
end
