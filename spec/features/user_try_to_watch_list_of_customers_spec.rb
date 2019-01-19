require 'spec_helper'

feature 'User try to watch list of customers' do
  
  scenario 'by seller account' do
    sign_up_with 'test@test.com', 'Vasya', 'password', 'password'
    user = User.find_by email: 'test@test.com'
    user.role = :seller
    user.save
    visit customers_path
    expect(page).to have_content('List of customers')
  end

  scenario 'not by seller account' do
    sign_up_with 'test@test.com', 'Vasya', 'password', 'password'
    
    visit customers_path
    expect(page).to have_no_content('List of customers')
  end

  def sign_up_with(email, name, password, confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: confirmation
    click_button 'Sign up'
  end

end