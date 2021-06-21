class Login < ApplicationRecord
  belongs_to :user

  validates :ip_address, uniqueness: { scope: :user_id }
end
