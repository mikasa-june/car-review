class CretateReviewHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_reviews, id: false  do |t|
      t.integer :review_id, index: true, foreign_key: true
      t.integer :hashtag_id, index: true, foreign_key: true
    end
  end
end

