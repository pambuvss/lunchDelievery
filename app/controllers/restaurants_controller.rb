class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.all.order(:name).paginate(page: params[:page], per_page: 14)
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

end
