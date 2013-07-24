require 'spec_helper'

feature 'user signs up', %Q{
  As a user
  I want to sign up
  So that I can author bookmarks
} do

  scenario 'user signs up with valid info' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

  end

  scenario 'user attempts to sign up with invalid info' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
end
