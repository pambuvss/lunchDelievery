class WelcomeController < ApplicationController
	def index
		if current_user
			get_days_of_this_week
		end
	end

	private 

	def get_days_of_this_week
		@days = Array.new
			 0.upto 6 do |i|
			 	@days.push  (Date.today.beginning_of_week+i)
 			end
 		@days
	end
end
