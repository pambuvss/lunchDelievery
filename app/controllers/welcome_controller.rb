class WelcomeController < ApplicationController
	def index
		if current_user&.customer?
			@restaurants = Restaurant.all.order(:name).paginate(page: params[:page], per_page: 14)
		end
	end

	private 

end
