class PostsController < ApplicationController
  def index
    render json: @user
  end

  def create
    @post = Post.new(post_params)
    @post.author_ip = request.remote_ip
    @post.user = @user

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
