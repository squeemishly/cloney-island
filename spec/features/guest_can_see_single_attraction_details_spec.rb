require 'rails_helper'

feature "guest navigates to individual attraction from city" do
  context "they are not logged in" do
    it "they see a the details of the attraction they clicked on" do
      VCR.use_cassette("single_attraction") do
        visit root_path

        within ('.column-list') do
          expect(page).to have_selector(".city-preview")
          click_on "Paris, France"
        end

        within (".column-list") do

          first('a').click
        end

        #Once again, we expect the map to change, to zoom in on the location of the
        # attraction. Not sure if we can test this, but if we can, it might be through
        # services rather than capybara features
        within ('.column-list') do
          expect(page).to have_selector(".attraction-details")
          expect(page).to have_selector(".attraction-details-img")
          expect(page).to have_selector(".attraction-details-name")
          # expect(page).to have_selector(".attraction-details-description")
          # expect(page).to have_selector(".attraction-details-wiki")
          # expect(page).to have_content("Wikipedia Article")
          expect(page).to have_selector(".attraction-details-website")
          expect(page).to have_content("Official Website")
          # expect(page).to have_selector(".attraction-details-admission")
          # expect(page).to have_content("Admission")
          expect(page).to have_selector(".attraction-details-hours")
          expect(page).to have_content("Hours of Operation")
          expect(page).to have_selector(".attraction-details-address")
          expect(page).to have_content("Address")
          expect(page).to have_selector(".attraction-details-phone")
          # expect(page).to have_selector(".attraction-details-email")
          expect(page).to have_selector(".attraction-details-review")
          expect(page).to have_content("Visitor Reviews")
          # expect(page).to have_selector(".add-attraction-button")

          # expect(page).to have_content("Sign in or create an account to leave a review")
          # expect(page).to have_selector(".city-details-tags")
          # Tags are an extension feature
        end
      end
    end
  end
end
