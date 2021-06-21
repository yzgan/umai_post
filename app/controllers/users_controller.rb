class UsersController < ApplicationController
  before_action :authenticate_user

  def login
    @user.logins.create(ip_address: request.remote_ip)
    render json: @user.generate_jwt_token, status: :ok
  end

  private

  def authenticate_user
    @user = User.find_by(username: params[:username], password: params[:password])

    render(json: 'invalid login', status: :unprocessable_entity) unless @user
  end
end
