require 'spec_helper'

feature 'add a bookmark', %Q{
  As a user
  I want to add a bookmark
  So that I can store and share urls I find useful
  } do

  #Acceptance Criteria
  # * I must specify a title
  # * I must specify a url
  # * The url must be properly formatted
  # * I can optionally specify a description
  # * Upon complying with the above rules, I receive a confirmation when I've added
  #     a bookmark

  scenario 'add a valid bookmark' do
    visit new_bookmark_path

    fill_in 'Title', with: 'Google'
    fill_in 'Url', with: 'http://www.google.com'
    fill_in 'Description', with: 'A great search engine'

    click_button 'Create Bookmark'
  end
end
