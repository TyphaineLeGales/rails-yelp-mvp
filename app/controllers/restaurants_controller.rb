class RestaurantsController < ApplicationController
  # before_action :find_restaurant
  def index
   @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    allowed_params = params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    @restaurant = Restaurant.new(allowed_params)
  end

  def create
    allowed_params = params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    @restaurant = Restaurant.create!(allowed_params)
    redirect_to restaurant_path
  end

  # private

  # def find_restaurant
  #   @restaurant
  # end
end
