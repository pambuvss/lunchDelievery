class WelcomeController < ApplicationController
	
	def index
		if current_user&.customer?
			redirect_to restaurants_path
		elsif current_user&.seller?
			@restaurant = Restaurant.find current_user.restaurant_id
			redirect_to @restaurant
		end
	end

end
