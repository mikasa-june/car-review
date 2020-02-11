class LikeReviewsController < ApplicationController
  before_action :back_index, only: [:create, :destroy]

  def create
    user = current_user
    review = Review.find(params[:review_id])
    if LikeReview.create(user_id: user.id, review_id: review.id)
      flash[:notice] = "#{review.title}をお気に入りに登録しました"
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
      flash[:notice] = "お気に入りを解除しました"
      redirect_to review
    else
      redirect_to root_path
    end
  end

  private
  def back_index
    redirect_to action: :index unless user_signed_in?
  end
end
