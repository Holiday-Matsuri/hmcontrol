class ApplicationReview < ApplicationRecord
  belongs_to :convention
  belongs_to :user
  belongs_to :event_application
  
end
