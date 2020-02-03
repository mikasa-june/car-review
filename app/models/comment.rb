class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  has_many :like_comments
  has_many :users, through: :like_comments
  validates :text, presence: true
end
