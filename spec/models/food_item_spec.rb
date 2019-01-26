require 'rails_helper'

RSpec.describe FoodItem, type: :model do
	describe "create" do
		  it "with empty information of FoodItem" do
		  	food_item = FoodItem.new
		  	expect(food_item.save).to eql false
		  end
		  it "with full information of FoodItem" do
		  	Restaurant.new(name: "test").save
		  	food_item = FoodItem.new(name: "Soup", price: 100, 
		  		type_of_course: :first_course, restaurant_id: 1) 
		  	expect(food_item.save).to eql true
		  end
		  it "unknown restaurant" do
		  	food_item = FoodItem.new(name: "Soup", price: 100,
		  		type_of_course: :first_course, restaurant_id: 1) 
		  	expect(food_item.save).to eql false
		  end
	end
	describe "get default photo" do
	  		it "average" do
	  			Restaurant.new(name: "test").save
			  	food_item = FoodItem.new(name: "Soup", price: 100, 
			  		type_of_course: :first_course, restaurant_id: 1)
			  	food_item.save
			  	thumb_url = food_item.photo_thumb
			  	expect(thumb_url).to eq("/assets/first_thumb.jpg")
	  		end
	  end
  	describe "one restaurant check" do
  		it "from one restaurant" do
  			Restaurant.new(name: "test").save
			food = Array.new  	
		  	3.times do
		  		food_item = FoodItem.new(name: "Soup", price: 100, 
			  		type_of_course: :first_course, restaurant_id: 1)
		  		food_item.save
			  	food.push food_item
		  	end
		  	expect(FoodItem.one_restaurant? *food).to eql true
  		end
  		it "from different restaurant" do
			food = Array.new  	
		  	3.times do
		  		restaurant = Restaurant.new(name: "test")
		  		restaurant.save
		  		food_item = FoodItem.new(name: "Soup", price: 100, 
			  		type_of_course: :first_course, restaurant: restaurant)
			  	food_item.save
			  	food.push food_item
		  	end
		  	expect(FoodItem.one_restaurant? *food).to eql false
  		end
  	end
  	describe "one date check" do
		it "one date" do
			restaurant = Restaurant.new(name: "test")
			restaurant.save
			food = Array.new  	
		  	3.times do
		  		food_item = FoodItem.new(name: "Soup", price: 100, 
			  		type_of_course: :first_course, restaurant: restaurant)
			  	food_item.save
			  	food.push food_item
		  	end
		  	expect(FoodItem.one_date?(*food)).to eql true
		end

  	end
end
