require 'rails_helper'

feature "guest visits root" do
  before(:each) do
    city = create(:city)
    city = create(:city, name: "London")
  end
  context "they are not logged in" do
    it "they see main page elements" do
      VCR.use_cassette("main_page_elements") do
        visit root_path
        within first(".attraction-preview").click

        expect(page).to have_selector(".logo")
        within('.navbar-main') do
          expect(page).to have_content('Sign In')
          expect(page).to have_content('New Trip')
        end

        within('.navbar-secondary') do
          expect(page).to have_content('Attractions')
          expect(page).to have_content('Tours')
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


        within (".column-list") do
          first("a").click
        end

        expect(current_path).to eq(search_path)
        within(".column-list") do
          expect(page).to have_content("Beijing")
          expect(page).to_not have_content("London")
          expect(page).to have_selector(".attraction-preview")
        end
      end
    end
  end
end
