class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reviews
  has_many :comments
  has_many :like_reviews
  has_many :fav_reviews, through: :like_reviews, source: :review

  def like(review)
    like_reviews.find_or_create_by(review_id: review.id)
  end

  def unlike(review)
    like_review = like_reviews.find_by(review_id: review.id)
    like_review.destroy if like_review
  end
end
