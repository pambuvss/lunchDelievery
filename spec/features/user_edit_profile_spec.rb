require 'spec_helper'

feature 'User edit profile' do
  
  scenario 'with valid information' do
    sign_up_with 'test@test.com', 'Vasya', 'password', 'password'
    edit_profile 'test@test.com', 'Anton', '123456', '123456', 'password'

    expect(page).to have_content('Anton')
  end

  scenario 'with invalid current password' do
    sign_up_with 'test@test.com', 'Vasya', 'password', 'password'
    edit_profile 'test@test.com', 'Anton', '123456', '123456', 'ikujhyftgd'

    expect(page).to have_content('Vasya')
  end

  def sign_up_with(email, name, password, confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: confirmation
    click_button 'Sign up'
  end

  def edit_profile email, name, pass, pass_confirmation, current_pass
    visit edit_user_registration_path
    
    fill_in 'Email', with: email
    fill_in 'Name', with: name
    fill_in 'Password', with: pass
    fill_in 'Password confirmation', with: pass_confirmation
    fill_in 'Current password', with: current_pass
    click_button 'Update'
  end

end