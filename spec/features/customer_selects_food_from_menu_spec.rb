require 'spec_helper'

feature 'Customer selects food from menu', :js => true   do
  
  scenario 'normal menu' do
    restaurant = create_restaurant
    food_from_menu = create_menu(restaurant)
    register_customer
    sign_in
    visit_menu(restaurant)
    select_food food_from_menu
    find(:css, '#proceed').click
    expect(page).to have_content("Let's finish your order")
  end

  scenario 'empty menu' do
    restaurant =  create_restaurant
    register_customer
    sign_in
    visit_menu(restaurant)
    expect(page).to have_content("Sorry, the restaurant didn't create the full menu for")
  end


  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test@test.com'
    click_button 'Log in'
  end


  def register_customer
    user = User.new(email: 'test@test.com',name: 'test', password:'test@test.com',
                    password_confirmation: 'test@test.com', role: :customer)
    user.save
  end

  def create_menu restaurant
    food = Array.new
    0.upto(2) do |i|
      food_item = FoodItem.new(name: "Food", price: 100, 
            type_of_course: i, restaurant: restaurant)
      food_item.save
      food.push food_item
    end
    food
  end

  def create_restaurant
    restaurant = Restaurant.new(name:"test")
    restaurant.save
    restaurant
  end

  def visit_menu restaurant
    visit menu_path(id: restaurant.id, date: Date.today.strftime("%_m %d %y"))
  end

  def select_food food
    choose('first', option: food[0].id)
    choose('main', option: food[1].id)
    choose('drink', option: food[2].id)
  end

end