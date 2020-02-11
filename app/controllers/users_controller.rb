class UsersController < ApplicationController

  def show
    users = User.all
    @user = users.find(params[:id])
    @reviews = @user.reviews.order("updated_at DESC")

    gets = LikeReview.where(user_id: [@user.id]).order("updated_at DESC").limit(40)

    @num = []
    gets.each do |get|
      @like_reviews = Review.find(get.review_id)
      @num << @like_reviews
    end

  end

end
