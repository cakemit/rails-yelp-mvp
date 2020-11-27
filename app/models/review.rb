class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, numericality: true, inclusion: { in: (0..5).to_a }
end
