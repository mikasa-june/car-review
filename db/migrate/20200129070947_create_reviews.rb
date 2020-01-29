class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.text :image
      t.integer :user_id, null: false, foreign_key: true
      t.integer :tag_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
