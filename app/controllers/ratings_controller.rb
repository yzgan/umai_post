class RatingsController < ApplicationController
  before_action :set_post

  def create
    @rating = @post.ratings.new(rating_params)

    if @rating.save
      meta = {
        average_rating: @rating.average_rating
      }
      render json: { **@rating.as_json, meta: meta }
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def rating_params
    params.require(:rating).permit(:value)
  end
end
