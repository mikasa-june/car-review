class ReviewHashtag < ApplicationRecord
  belongs_to :review
  belongs_to :Hashtag
  validates  :review_id, presence: true
  validates  :Hashtag_id,   presence: true
end