class Order < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	has_many :orders_list

	validates :count, :numericality => { :greater_than => 0 }, presence: true
	validates :address, presence: true
	validates_associated :user
  	validates_associated :restaurant
  	validate :valid_delivery_date?
  	
  	def valid_delivery_date?
	    unless delivery_time.today?
	      errors.add(:delivery_time, "date should be today!")
	    end
  	end

  	def is_users_order? check_user
  		user == check_user || 
  		restaurant == check_user.restaurant
  	end

  	def food
		@first = orders_list.first.food_item
		@main = orders_list.second.food_item
		@drink = orders_list.third.food_item
		[@first, @main, @drink ]
	end

	def price_of_one_lunch
		food.inject(0){|sum,x| sum + x.price }
	end

	def total_price
		price_of_one_lunch * count
	end
end
