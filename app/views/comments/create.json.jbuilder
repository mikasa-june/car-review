json.text @comment.text
json.user_id @comment.user.id
json.review_id @comment.review.id
json.user_name @comment.user.name
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.updated_at @comment.updated_at.strftime("%Y年%m月%d日 %H時%M分")