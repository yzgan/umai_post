class ApplicationController < ActionController::API
  include Pagy::Backend

  before_action :set_user

  private

  def set_user
    return unless request.headers['Authorization']

    auth_header = request.headers['Authorization'].split(' ')
    bearer, token = auth_header
    token = bearer if auth_header.size == 1
    @user = User.find_from_jwt(token)
  end
end
