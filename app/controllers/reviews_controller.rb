class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order("updated_at DESC").limit(40)
    @sidereviews = Review.order("RAND()").limit(3)
  end

  def new
    @review = Review.new
    @category1 = Category.where(group_id: 0)
    @category3 = Category.where(group_id: 2)
    @category4 = Category.where(group_id: 3)

    @maker1 = Category.where(group_id: 11)
    @maker2 = Category.where(group_id: 12)
    @maker3 = Category.where(group_id: 13)
    @maker4 = Category.where(group_id: 14)
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
    cattag = Category.joins(:category_reviews).where({category_reviews: {review_id: [@review.id]}})
    # このレビューに付与されているカテゴリーを全て取得
    @tag1 = cattag.find_by(group_id: 0)
    @tag3 = cattag.find_by(group_id: 2)
    @tag4 = cattag.find_by(group_id: 3)

    @maker1 = cattag.find_by(group_id: 11)
    @maker2 = cattag.find_by(group_id: 12)
    @maker3 = cattag.find_by(group_id: 13)
    @maker4 = cattag.find_by(group_id: 14)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
    @category1 = Category.where(group_id: 0)
    @category3 = Category.where(group_id: 2)
    @category4 = Category.where(group_id: 3)

    @maker1 = Category.where(group_id: 11)
    @maker2 = Category.where(group_id: 12)
    @maker3 = Category.where(group_id: 13)
    @maker4 = Category.where(group_id: 14)
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to root_path
  end

  def search
    @reviews = Review.search(params[:keyword])
  end

  private
  # 暫定的にtag_idを1としている
  def review_params
    params.require(:review).permit(:title, :text, :image, category_ids: []).merge(user_id: current_user.id)
  end
end
