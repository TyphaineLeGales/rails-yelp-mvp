class RestaurantsController < ApplicationController
  # before_action :find_restaurant
  def index
   @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    allowed_params = params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    @restaurant = Restaurant.new(allowed_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # private

  # def find_restaurant
  #   @restaurant
  # end
end
