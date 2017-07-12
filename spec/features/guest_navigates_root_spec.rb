require 'rails_helper'

feature "guest navigates to city from root" do
  context "they are not logged in" do
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
