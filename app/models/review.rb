class Review < ApplicationRecord
  belongs_to :event_application
  belongs_to :user
  validates :feasibility, presence: true
  validates :relevance, presence: true
  validates :structure, presence: true
  validates :fun_factor, presence: true
  validates :style, presence: true  
end
