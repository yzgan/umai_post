class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ratings, dependent: :destroy

  scope :without_user, -> { where(user_id: nil) }
  scope :with_user, -> { where.not(user_id: nil) }
  scope :with_ip, -> { where.not(author_ip: nil) }
end
