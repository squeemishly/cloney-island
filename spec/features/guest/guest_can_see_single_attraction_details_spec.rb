require 'rails_helper'

feature "guest navigates to individual attraction from city" do
  before(:each) do
    city1 = create(:city)
    city2 = create(:city, name: "London", place_id: "ChIJdd4hrwug2EcRmSrV3Vo6llI")
  end
  context "they are not logged in" do
    it "they see a the details of the attraction they clicked on" do
      VCR.use_cassette("single_attraction") do
        visit root_path

        within (".column-list") do
          first("a").click
        end

        expect(current_path).to eq(search_path)

        within (".column-list") do
          first("a").click
        end

        expect(current_path).to eq(search_path)

        within ('.column-list') do
          # expect(page).to have_selector(".attraction-details")
          expect(page).to have_selector(".attraction-details-img")
          expect(page).to have_selector(".attraction-details-name")
          expect(page).to have_selector(".attraction-details-website")
          expect(page).to have_selector(".attraction-details-hours")
          expect(page).to have_selector(".attraction-details-address")
          expect(page).to have_selector(".attraction-details-phone")
          expect(page).to have_selector(".attraction-details-review")
          expect(page).to have_selector(".add-attraction-button")
        end
      end
    end

    it "they see a the details based on attraction they clicked on" do
      VCR.use_cassette("single_attraction_different_attributes") do
        visit root_path

        within (".column-list") do
          first('a').click
        end
        
        within (".column-list") do
          first('a').click
        end

        within ('.column-list') do
          expect(page).to have_selector(".attraction-details")
          expect(page).to have_selector(".attraction-details-img")
          expect(page).to have_selector(".attraction-details-name")
          expect(page).to have_selector(".attraction-details-website")
          expect(page).to have_selector(".attraction-details-hours")
          expect(page).to have_selector(".attraction-details-address")
          expect(page).to have_selector(".attraction-details-phone")
          expect(page).to have_selector(".attraction-details-review")
          # expect(page).to have_selector(".add-attraction-button")

          # expect(page).to have_content("Sign in or create an account to leave a review")
          # expect(page).to have_selector(".city-details-tags")
          # Tags are an extension feature
        end
      end
    end
  end
end
