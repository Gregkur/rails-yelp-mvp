class ReviewsController < ApplicationController
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
