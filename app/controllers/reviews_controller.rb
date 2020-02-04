class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.includes(:user).order("created_at DESC")
    @like_reviews = LikeReview.where(review_id: [@review.id])
    @like_review_count = @like_reviews.count
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to root_path
  end

  def search
    @reviews = Review.search(params[:keyword])
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @reviews = @tag.reviews.build
    @review  = @tag.reviews.page(params[:page])
    @comment    = Comment.new
    @comments   = @reviews.comments
  end

  private
  # 暫定的にtag_idを1としている
  def review_params
    params.require(:review).permit(:title, :text, :image).merge(user_id: current_user.id, tag_id: 1)
  end
end
