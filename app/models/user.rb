class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :fav_reviews, through: :like_reviews, source: :review
  has_many :like_comments
  has_many :fav_comments, through: :like_comments, source: :comment

  validates :username,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 }

  def like(review)
    like_reviews.find_or_create_by(review_id: review.id)
  end

  def unlike(review)
    like_review = like_reviews.find_by(review_id: review.id)
    like_review.destroy if like_review
  end
end
