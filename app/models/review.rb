class Review < ApplicationRecord
  belongs_to :restaurant
  ratings = [0, 1, 2, 3, 4, 5]
  validates :content, presence: { message: "can't be blank" }
  validates :rating, presence: { message: "can't be blank" }
  validates :rating, numericality: { message: "only numbers allowed" }
  validates :rating, inclusion: { in: ratings, message: 'only ratings from 1 to 5 allowed!' }
end
