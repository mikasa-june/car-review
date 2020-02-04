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

  after_create do
    review = Review.find_by(id: self.id)
    hashtags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      review.hashtags << tag
    end
  end

  before_update do 
    review = Review.find_by(id: self.id)
    review.hashtags.clear
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      review.hashtags << tag
    end
  end
end
