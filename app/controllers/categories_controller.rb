class CategoriesController < ApplicationController

  def index
    @categories1 = Category.where(group_id: 0)
    @categories3 = Category.where(group_id: 2)
    @categories4 = Category.where(group_id: 3)
    # @maker1=日本メーカー
    @maker1 = Category.where(group_id: 11)
    @maker2 = Category.where(group_id: 12)
    @maker3 = Category.where(group_id: 13)
    @maker4 = Category.where(group_id: 14)
  end
  
  def new
    @category = Category.new
  end

  def create
    # @group = Group.new(group_params)
  end

  def show
    @category = Category.find(params[:id])
    @reviews = Review.joins(:category_reviews).where({category_reviews: {category_id: [@category.id]}}).order("updated_at DESC")
    # カテゴリーidが一致するレビューを全て取得
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
