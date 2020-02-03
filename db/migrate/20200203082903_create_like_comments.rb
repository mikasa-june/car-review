class CreateLikeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :like_comments do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
      t.index [:user_id, :comment_id], unique: true
    end
  end
end
