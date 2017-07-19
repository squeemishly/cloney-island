require 'rails_helper'

RSpec.describe "Admin" do
  before :each do
    admin = create(:user, role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user = create(:user)
  end

  context "searches an existing user" do
    it "searches for user" do
      visit "/admin/dashboard"

      fill_in :query, with: user.email
      click_on "Search"

      expect(current_path).to eq("/admin/query") #admin view for the profile page
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.email)
      expect(page).to have_field("Vendor", checked: false)
      expect(page).to have_field("Admin", checked: false)
      expect(page).to have_field("Enabled", checked: true)
      expect(page).to have_field("Disabled", checked: false)
    end
  end

  context "searches a user that doesn't exist" do
    it "searches for non existing user" do
      visit "/admin/dashboard"

      fill_in :query, with: "wrong@email.com"
      click_on "Search"
      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
end

# https://stackoverflow.com/questions/41647780/how-to-check-whether-the-check-box-is-checked-or-not-capybara-rspec

# As an admin
# When I visit /admin/dashboard
# And I search for a user by email
# I am taken to a user show page 
# And I expect the path to be /admin/user/:id
# And I should see on the page
# User.name
# User.email
# User.role (as checkboxes (only adding “vendor” or “admin”)
# User.enabled/disables (as radio button
