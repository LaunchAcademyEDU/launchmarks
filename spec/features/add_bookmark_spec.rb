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

    page_title = 'Google'

    fill_in 'Title', with: page_title
    fill_in 'Url', with: 'http://www.google.com'
    fill_in 'Description', with: 'A great search engine'

    click_button 'Create Bookmark'

    expect(page).to have_content('Bookmark saved')
    expect(page).to have_content(page_title)
  end

  scenario 'attempt to add an invalid bookmark' do
    visit new_bookmark_path
    click_button 'Create Bookmark'
    expect(page).to have_content("can't be blank")
  end
end
