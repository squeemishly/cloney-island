require 'rails_helper'

feature "guest visits root" do
  context "they are not logged in" do
    it "they see main page elements" do
      visit root_path

      within('.navbar-main') do
        expect(page).to have_content('Sign In')
        expect(page).to have_content('New Trip')
        expect(page).to have_content('Cloney Island Travel')
      end

      within('.navbar-secondary') do
        expect(page).to have_content('Places')
        expect(page).to have_content('Tours')
      end

      within('.navbar-filters') do
        expect(page).to have_content('Sightseeing')
        expect(page).to have_content('Shopping')
        expect(page).to have_content('Restaurants')
        expect(page).to have_content('Museums')
        expect(page).to have_content('Family')
        expect(page).to have_content('Transport')
        expect(page).to have_content('Nightlife')
        expect(page).to have_content('Outdoors')
        expect(page).to have_content('Sports')
        expect(page).to have_content('Relaxation')
      end

      expect(page).to have_selector(".main-map")
      expect(page).to have_selector(".column-list")
    end
  end

  context "they click on a city" do
    it "they see the display page for the city they clicked on" do
      visit root_path

      within ('.column-list') do
        expect(page).to have_selector(".city-preview")
        click_on "Paris, France"
      end

      # We expect the map to center on Paris (or whatever city we click), but it's
      # Javascript. I don't think capybara can test for javascript

      within(".column-list") do
        expect(page).to have_content("Paris")
        expect(page).to_not have_content("London")
        expect(page).to have_selector(".place-preview")
      end

      # We expect the path to change to show the lat and long coordinates
      # I don't know how to test for that -- it might be more of a service test?
    end
  end
end
