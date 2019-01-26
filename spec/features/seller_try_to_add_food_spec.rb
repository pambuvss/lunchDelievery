require 'spec_helper'

feature 'Seller try to add food' do
  
  scenario 'with valid data' do
    register_seller
    sign_in
    add_food("Cola", "drink",5)

    expect(page).to have_no_content('Add food for today')
  end

  scenario 'with negative price' do
    register_seller
    sign_in
    add_food("Cola", "drink", -10)

    expect(page).to have_content('Price must be greater than 0')
  end

  scenario 'with empty fields' do
    register_seller
    sign_in
    add_food("", "", "")

    expect(page).to have_content("can't be blank")
  end  


  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: 'test@test.test'
    click_button 'Log in'
  end

  def register_seller
    restaurant = Restaurant.new name: "test"
    restaurant.save
    user = User.new(name: "Test", email:"test@test.test", password: "test@test.test",
        password_confirmation: "test@test.test", role: :seller, restaurant: restaurant)
    user.save
  end

  def add_food name, type, price
    visit new_food_item_path
    fill_in 'Name', with: name
    find(:css, "#food_item_type_of_course").find(:option, type).select_option
    fill_in 'Price', with: price
    click_button 'Add food'
  end
end