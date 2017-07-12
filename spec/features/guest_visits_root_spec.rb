require 'rails_helper'

feature "guest visits root" do
  context "they are not logged in" do
    it "they see main page elements" do
      visit root_path

      within('.navbar-main') do
        expect(page).to have_content('Sign In')
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
end
