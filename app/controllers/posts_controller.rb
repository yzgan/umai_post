class PostsController < ApplicationController
  def index
    render json: @user
  end
end
