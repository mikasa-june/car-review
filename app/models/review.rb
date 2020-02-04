class Review < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :users, through: :like_reviews

  validates :title, presence: true
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
