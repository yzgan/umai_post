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
    Post.with_ip.distinct.pluck(:author_ip).map do |ip_address|
      [
        ip_address,
        Login.find_by(ip_address: ip_address)&.find_user_ip_addresses
      ]
    end
  end
end
