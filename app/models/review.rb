class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  def self.search(search)
    if search
      Review.where('title LIKE(?)', "%#{search}%")
    else
      Review.all
    end
  end
end
