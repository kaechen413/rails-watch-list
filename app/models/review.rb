class Review < ApplicationRecord
  belongs_to :list
  validates :rating, presence: true
  validates :content, presence: true
  RANGE = (0..5)
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: RANGE }
end
