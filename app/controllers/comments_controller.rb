class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to "/reviews/#{@comment.review.id}"}
      format.json
    end
  end

  def destroy
    # review = Review.find(params[:id])
    # comment = review.comment
    # comment.destroy
    # redirect @review
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
