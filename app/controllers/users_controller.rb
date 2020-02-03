class UsersController < ApplicationController

  def show
    users = User.all
    @user = users.find(params[:id])
    @reviews = @user.reviews
    # @comments
  end

end
