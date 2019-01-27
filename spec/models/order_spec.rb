require 'rails_helper'

RSpec.describe Order, type: :model do
	describe "create" do
		  it "with valid information" do
	  		restaurant = create_restaurant
		  	food = create_food restaurant
			customer = create_customer
			count = 1
			delivery_time = DateTime.now
			address = "Test address"
			order = create_order(food, customer, restaurant, address, delivery_time, count)		  	
			expect(order.save).to eq true
		  end
		  it "with negative count" do
		  	restaurant = create_restaurant
		  	food = create_food restaurant
			customer = create_customer
			count = -1
			delivery_time = DateTime.now
			address = "Test address"
			order = create_order(food, customer, restaurant, address, delivery_time, count)		  	
			expect(order.save).to eq false
		  end
		  it "with count greater than 1000" do
		  	restaurant = create_restaurant
		  	food = create_food restaurant
			customer = create_customer
			count = 1001
			delivery_time = DateTime.now
			address = "Test address"
			order = create_order(food, customer, restaurant, address, delivery_time, count)		  	
			expect(order.save).to eq false
		  end
		  it "with not today's date" do
		  	restaurant = create_restaurant
		  	food = create_food restaurant
			customer = create_customer
			count = 1001
			delivery_time = Date.yesterday.to_time
			address = "Test address"
			order = create_order(food, customer, restaurant, address, delivery_time, count)		  	
			expect(order.save).to eq false
		  end
    end
    
    describe "price counting" do
    	it "one lunch" do
    		order = create_valid_order
    		expect(order.price_of_one_lunch). to eq(300)
    	end
    	it "total" do
    		order = create_valid_order
    		expect(order.total_price). to eq(1500)
    	end
    end

	def create_restaurant
		restaurant = Restaurant.new name: "Test"
		restaurant.save
		restaurant
	end

	def create_food restaurant
		food = Array.new
		0.upto(2) do |i|
			food_item = FoodItem.new(name: "test", price: 100, 
				type_of_course: i, restaurant: restaurant)
			food_item.save
			food.push food_item
		end
		food
	end

	def create_customer
		customer = User.new(name: "test", email: "test@test.com", 
			password: "test@test.com", password_confirmation: "test@test.com",
			role: :customer)
		customer.save
		customer
	end

	def create_order food,user,restaurant,address,delivery_time,count
		order = Order.new(user: user, restaurant: restaurant,address: address,
			delivery_time: delivery_time, count: count)
		order
	end

	def create_order_list order, food
		OrdersList.create order, *food
	end

	def create_valid_order
			restaurant = create_restaurant
		  	food = create_food restaurant
			customer = create_customer
			count = 5
			delivery_time = DateTime.now
			address = "Test address"
			order = create_order(food, customer, restaurant, address, delivery_time, count)
			order.save
			create_order_list order, food
			order
	end

end