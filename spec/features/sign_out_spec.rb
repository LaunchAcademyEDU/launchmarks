require 'spec_helper'

feature 'user signs out', %Q{
  As a user
  I want to sign out
  So that my identity is protected
} do

  # Acceptance Criteria
  # * When I'm authenticated, I have an option to sign out
  # * When I sign out, any context of my identity is lost in the session

  scenario 'sign out' do
    login_as(FactoryGirl.create(:user))
    visit root_path
    click_link 'Sign Out'
    expect(page).to have_content('Signed out')
    expect(page).to have_content('Sign In')
  end
end
