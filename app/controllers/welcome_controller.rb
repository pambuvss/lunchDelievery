class WelcomeController < ApplicationController
	def index
		if current_user&.customer?
			@restaurants = Restaurant.all.order :name
		end
	end

	private 

end
