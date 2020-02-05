class CategoriesController < ApplicationController

  def index
    
  end
  
  def new
    @category = Category.new
  end

  def create
    @group = Group.new(group_params)
  end

  def show
    @category = Category.find(params[:id])
    @reviews = Review.joins(:category_reviews).where({category_reviews: {category_id: [@category.id]}})
    # カテゴリーidが一致するレビューを全て取得
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
