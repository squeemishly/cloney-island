require 'rails_helper'

feature "guest navigates to individual attraction from city" do
  context "they are not logged in" do
    it "they see a the details of the attraction they clicked on" do
      visit root_path

      within ('.column-list') do
        expect(page).to have_selector(".city-preview")
        click_on "Paris, France"
      end

      within first(".place-preview") do
        page.find(".place-preview-name").click
      end

      #Once again, we expect the map to change, to zoom in on the location of the
      # attraction. Not sure if we can test this, but if we can, it might be through
      # services rather than capybara features

      within ('.column-list') do
        expect(page).to have_selector(".city-details")
        expect(page).to have_selector(".city-details-img")
        expect(page).to have_selector(".city-details-name")
        expect(page).to have_selector(".city-details-description")
        expect(page).to have_selector(".city-details-wiki")
        expect(page).to have_content("Wikipedia Article")
        expect(page).to have_selector(".city-details-website")
        expect(page).to have_content("Official Website")
        expect(page).to have_selector(".city-details-admission")
        expect(page).to have_content("Admission")
        expect(page).to have_selector(".city-details-hours")
        expect(page).to have_content("Opening Hours")
        expect(page).to have_selector(".city-details-address")
        expect(page).to have_content("Address")
        expect(page).to have_selector(".city-details-phone")
        expect(page).to have_selector(".city-details-email")
        expect(page).to have_selector(".city-details-review")
        expect(page).to have_content("Visitor Reviews")
        expect(page).to have_content("Sign in or create an account to leave a review")
        # expect(page).to have_selector(".city-details-tags")
        # Tags are an extension feature
      end
    end
  end
end
