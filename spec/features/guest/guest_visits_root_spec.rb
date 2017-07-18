require 'rails_helper'

feature "guest visits root" do
  context "they are not logged in" do
    it "they see main page elements" do
      VCR.use_cassette("main_page_elements") do
        visit root_path

        expect(page).to have_selector(".logo")
        within('.navbar-main') do
          expect(page).to have_content('Sign In')
          expect(page).to have_content('New Trip')
        end

        within('.navbar-secondary') do
          expect(page).to have_content('Attractions')
          expect(page).to have_content('Tours')
        end

        within('.navbar-filters') do
          expect(page).to have_content('Sightseeing')
          expect(page).to have_content('Shopping')
          expect(page).to have_content('Restaurants')
          expect(page).to have_content('Museums')
          expect(page).to have_content('Camping')
          expect(page).to have_content('Transport')
          expect(page).to have_content('Nightlife')
          expect(page).to have_content('Parks')
          expect(page).to have_content('Sports')
          expect(page).to have_content('Relaxation')
        end

        expect(page).to have_selector(".main-map")
        expect(page).to have_selector(".column-list")
      end
    end
  end

  context "they click on a city" do
    it "they see the display page for the city they clicked on" do
      VCR.use_cassette("display_page_for_city") do
        visit root_path

        within ('.column-list') do
          expect(page).to have_selector(".city-preview")
          click_on "Paris, France"
        end

        within(".column-list") do
          expect(page).to have_content("Paris")
          expect(page).to_not have_content("London")
          expect(page).to have_selector(".attraction-preview")
        end
      end
    end
  end
end
