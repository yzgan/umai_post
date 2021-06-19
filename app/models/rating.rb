class Rating < ApplicationRecord
  belongs_to :post

  after_create :update_average_rating

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  delegate :average_rating, to: :post

  private

  def update_average_rating
    post.update_columns(average_rating: post.ratings.average(:value))
  end
end
