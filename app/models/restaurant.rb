class Restaurant < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  categories = %w[chinese italian japanese french belgian]
  validates :name, presence: { message: "can't be blank" }
  validates :category, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }
  validates :category, inclusion: { in: categories, message: 'this is not a valid category'}
end