require 'spec_helper'
require 'capybara/rails'

feature 'Add Movies' do

  scenario 'User can add movies and see them in chronological order' do
    visit "/"
    click_on "Add movie"
    fill_in "Name", with: "Test Movie"
    fill_in "Year", with: "1996"
    fill_in "Synopsis", with: "Test Synopsis"
    click_on "Create Movie"
    expect(page).to have_content("Test Movie (1996)")
    expect(page).to have_content("Test Synopsis")

    visit "/"
    click_on "Add movie"
    fill_in "Name", with: "Test Movie2"
    fill_in "Year", with: "2010"
    fill_in "Synopsis", with: "Test Synopsis2"
    click_on "Create Movie"
    expect(page).to have_content("Test Movie2 (2010)")
    expect(page).to have_content("Test Synopsis2")
    expect(page).to have_content("Test Movie (1996)")
    expect(page).to have_content("Test Synopsis")

  end

  scenario 'User sees error message when input wrong data' do

  visit "/"
  click_on "Add movie"
  fill_in "Name", with: ""
  fill_in "Year", with: ""
  fill_in "Synopsis", with: ""
  click_on "Create Movie"
  expect(page).to have_content("Name can't be blank")
  expect(page).to have_content("Synopsis can't be blank")
  expect(page).to have_content("Year can't be blank")
  expect(page).to have_content("Year is the wrong length (should be 4 characters)")
  expect(page).to have_content("Year is not a number")

  end

end