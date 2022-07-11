class Convention < ApplicationRecord
  extend FriendlyId
  friendly_id :convention_title, use: :slugged
  enum status: [:active, :inactive, :archived]
  has_many :vendors
  has_many :guests
  has_many :artists
  has_many :events

  def convention_title
    "holiday-matsuri-#{year.to_s}"
  end

  def panel_cap_check(count)
    if count == panel_soft_cap.to_i
      panel_soft_cap_date = Date.today
      panel_hard_cap_date = Date.today + 21.days
    end
  end
  def con_updated?(date)
    if self.updated_at > date
      true
    else
      false
    end
  end

  def panels_updated?(date)
    if self.panels.where("updated_at > ?", date).count > 0
      "panels"
    end
  end
  def events_updated?(date)
    if self.events.where("updated_at > ?", date).count > 0
      "events"
    end
  end
  def artists_updated?(date)
    if self.artists.where("updated_at > ?", date).count > 0
      "artists"
    end
  end
  def vendors_updated?(date)
    if self.vendors.where("updated_at > ?", date).count > 0
      "vendors"
    end
  end
  def guests_updated?(date)
    if self.guests.where("updated_at > ?", date).count > 0
      "guests"
    end
  end
  
  
end
