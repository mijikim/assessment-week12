require 'rails_helper'
require 'capybara/rails'

feature 'Add Movies' do

  scenario 'User can add movies' do
    visit "/"
    click_on "Add Movie"
    fill_in "Name", with: "Test Movie"
    select "1996", from: "Year"
    fill_in "Synopsis", with: "Test Synopsis"
    click_on "Create Movie"
    expect(page).to have_content("Test Movie (1996)")
    expect(page).to have_content("Test Synopsis")
  end

end