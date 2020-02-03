class LikeReviewsController < ApplicationController

  def create
    user = current_user
    review = Review.find(params[:review_id])
    if LikeReview.create(user_id: user.id, review_id: review.id)
      redirect_to review
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    review = Review.find(params[:review_id])
    if like_review = LikeReview.find_by(user_id: user.id, review_id: review.id)
      like_review.delete
      redirect_to review
    else
      redirect_to root_path
    end
  end

end
