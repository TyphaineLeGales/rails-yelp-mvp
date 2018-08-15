class ReviewsController < ApplicationController
  def show
    @reviews = Review.find(params[:retaurant_id])
  end

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    allowed_params = params.require(:review).permit(:content, :rating)
    @review = Review.new(allowed_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    allowed_params = params.require(:review).permit(:content, :rating)
    @review.update(allowed_params)
    # redirect_to tasks_path(@task.id)
  end
end
