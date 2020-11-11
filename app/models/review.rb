class Review < ApplicationRecord
  belongs_to :restaurant
  ratings = [0, 1, 2, 3, 4, 5]
  validates :content, presence: { message: "can't be blank" }
  validates :rating, presence: { message: "can't be blank" }
  validates :rating, numericality: { message: "only numbers allowed" }
  validates :rating, inclusion: { in: ratings, message: 'only ratings from 1 to 5 allowed!' }

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /restaurants/3/reviews
  # Body contains data for attributes
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save # No guarantee it will save!
      # Happy path :)
      # Don't redirect if save went wrong
      redirect_to restaurant_path(@restaurant)
    else
      # Sad path :(
      render "new"
    end
  end
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

