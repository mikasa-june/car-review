class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @group = Group.new(group_params)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
