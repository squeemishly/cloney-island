require 'rails_helper'

feature "guest navigates to city from root" do
  context "they are not logged in" do
    it "they see a list of attractions in the the city they clicked on" do
      visit root_path

      within ('.column-list') do
        expect(page).to have_selector(".city-preview")
        click_on "Paris, France"
      end

      within first(".place-preview") do
        expect(page).to have_selector(".place-preview-img")
        expect(page).to have_selector(".place-preview-name")
        expect(page).to have_selector(".place-preview-description")
      end
    end
  end
end