class Convention < ApplicationRecord
  enum status: [:hidden, :active]
end
