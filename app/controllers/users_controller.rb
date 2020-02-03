class UsersController < ApplicationController

  def show
    users = User.all
    @user = users.find(params[:id])
    @reviews = @user.reviews

    gets = LikeReview.where(user_id: [@user.id])

    @num = []
    gets.each do |get|
      @like_reviews = Review.find(get.review_id)
      @num << @like_reviews
    end

  end

end
