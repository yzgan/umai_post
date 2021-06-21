class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all)
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
    @pagy, @posts = pagy(Post.order(average_rating: :desc).limit(count))
  end

  def ip_listing
    @ip_list = ip_list_from_posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def ip_list_from_posts
    Post
      .pluck(:author_ip, :user_id)
      .group_by(&:first)
      .transform_values { |ip_users| ip_users.map(&:last).map { |user_id| User.find_by(id: user_id)&.username }.compact }
  end
end
