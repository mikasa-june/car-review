class Review < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :users, through: :like_reviews

  has_many :category_reviews, dependent: :destroy
  has_many :categories, through: :category_reviews

  validates :title, presence: true, length: { maximum: 60 }
  validates :image, presence: true
  validates :text, presence: true
  
  def self.search(search)
    if search
      Review.where('title LIKE(?)', "%#{search}%")
    else
      Review.all
    end
  end
end
