class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
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
