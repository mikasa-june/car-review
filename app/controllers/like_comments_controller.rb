class LikeCommentsController < ApplicationController

  def create
    user = current_user
    comment = Comment.find(params[:comment_id])
    if LikeComment.create(user_id: user.id, comment_id: comment.id)
      redirect_to comment
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    comment = Comment.find(params[:comment_id])
    if like_comment = LikeComment.find_by(user_id: user.id, comment_id: comment.id)
      like_comment.delete
      redirect_to comment
    else
      redirect_to root_path
    end
  end

end
