class Learn < ApplicationRecord
  belongs_to :user
  has_many :likers, through: :favorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :studydate, presence: true
end
