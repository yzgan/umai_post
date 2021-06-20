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

  def top
    count = params[:top_count].presence || 10
    @posts = Post.order(average_rating: :desc).limit(count)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
