class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :like_reviews
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
