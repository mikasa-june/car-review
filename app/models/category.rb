class Category < ApplicationRecord
  has_many :category_reviews
  has_many :reviews, through: :category_reviews

  validates :name, presence: true, uniqueness: true
end
