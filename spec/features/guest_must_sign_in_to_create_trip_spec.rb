require 'rails_helper'

feature "guest prompted to sign in before creating trip" do
  context "they are not logged in" do
    it "they see a sign in prompt after clicking on add attraction button" do
      visit root_path

      within ('.column-list') do
        expect(page).to have_selector(".city-preview")
        click_on "Paris, France"
      end

      within first(".place-preview") do
        find(".add-attraction-button").click
      end

      # expect(current_path).to eq(new_trip_error_path)
      # Do we need a whole new path to tell someone they need to log in?
      # Would the login path make more sense with a flash message?
      expect(current_path).to eq(login_path)
      expect(page).to have_content("You must sign in or create an account to create a trip")
      expect(page).to have_content("Sign In")
      expect(page).to have_content("Create Account")
    end
  end
end
