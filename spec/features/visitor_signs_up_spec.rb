require 'spec_helper'

feature 'Visitor signs up' do
  
  scenario 'with valid email, password and password confirmation' do
    sign_up_with 'scenario@test.com', 'test@test.com', 'test@test.com'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with invalid password' do
    sign_up_with 'valid@example.com', '123', '321'

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password, confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: confirmation
    click_button 'Sign up'
  end
end