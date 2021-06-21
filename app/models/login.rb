class Login < ApplicationRecord
  belongs_to :user

  validates :ip_address, uniqueness: { scope: :user_id }

  def find_user_ip_addresses
    user.logins.pluck(:ip_address)
  end
end
