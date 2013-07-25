require 'spec_helper'

feature 'user signs up', %Q{
  As a user
  I want to sign up
  So that I can author bookmarks
} do

  # Acceptance Criteria
  # * I must specify a valid email address
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated
  # * I can sign up via facebook

  scenario 'user signs up with valid info' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'

    # the selector below is unideal, but we use it due to simple form
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

  end

  scenario 'user attempts to sign up with invalid info' do
    visit new_user_registration_path

    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'user can sign in via facebook' do
    stub_auth_registration
    visit new_user_registration_path
    click_link 'Sign In Via Facebook'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
