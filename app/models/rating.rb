class Rating < ApplicationRecord
  validates :value, presence: true, numerically: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
