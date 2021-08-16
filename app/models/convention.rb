class Convention < ApplicationRecord
  extend FriendlyId
  friendly_id :convention_title, use: :slugged
  enum status: [:hidden, :active]

  def convention_title
    "holiday-matsuri-#{year.to_s}"
  end

  def panel_cap_check(count)
    if count == panel_soft_cap.to_i
      panel_soft_cap_date = Date.today
      panel_hard_cap_date = Date.today + 21.days
    end
  end
  
  
end
