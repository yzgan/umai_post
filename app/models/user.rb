class User < ApplicationRecord
  validates :username, :password, presence: true

  def self.find_from_jwt(token)
    User.find JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' }).first.with_indifferent_access.dig(:id)
  end

  def generate_jwt_token
    JWT.encode({ id: id, exp: (DateTime.current + 24.hours).to_i }, Rails.application.secret_key_base, 'HS256')
  end
end
