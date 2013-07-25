require 'spec_helper'

feature 'user uploads avatar', %Q{
  As an authenticated user
  I want to upload an avatar
  So that I can identity myself
} do
  # Acceptance Criteria
  # * I can upload a png, jpg, or gif
  # * If I upload anything but the above, I get an error
  # * The avatar appears next to bookmarks I've created
  # * I must be signed in to edit my avatar
  # * I can only upload an avatar for my account
  # *
  let(:user) { FactoryGirl.create(:user) }
  scenario 'upload a valid image' do
    login_as(user)
    visit edit_user_path(user)
    attach_file 'Avatar', Rails.root.join('spec/file_fixtures/launch_academy_logo.png')
    click_button 'Update'
    expect(page).to have_content('User updated')
    expect(User.first.avatar.url).to be_present
  end


  scenario 'upload an invalid file' do
    login_as(user)
    visit edit_user_path(user)
    attach_file 'Avatar', Rails.root.join('spec/file_fixtures/invalid_avatar.txt')
    click_button 'Update'
    expect(page).to_not have_content('User updated')
    expect(User.first.avatar.url).to be_blank
  end


  scenario 'not signed in' do
    visit edit_user_path(user)

    expect(page).to have_content('You need to sign in')
  end
end
