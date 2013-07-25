require 'spec_helper'

feature 'User signs in', %Q{
  As a user
  I want to sign in
  So that I can manage my bookmarks
} do

  # Acceptance Criteria:
  # * if I specify a valid, previously registered email and password,
  #   I am authenticated and I gain access to the system
  # * If I specify an invalid email and password, I remain unauthenticated
  # * If I am already signed in, I can't sign in again
  #

  scenario 'valid user signs in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    expect(page).to have_content('Signed in')
    expect(page).to have_content('Sign Out')
  end
  scenario 'invalid sign in'
  scenario 'user is already signed in'
end
