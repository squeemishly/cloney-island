require 'rails_helper'

Rspec.describe "Admin" do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    admin = create(:user)
    user = create(:user)
    role = create(:role, name: "admin")
    admin.roles << role
  end

  context "disables user account" do
    it "changes the status of a user to disabled" do
      visit "/admin/user/#{user.id}" #admin view for the profile page
      expect(page).to have_field("Disabled", checked: false)

      find(:css, ".disable").set(true)
      click_on "Save"

      expect(current_path).to eq("/admin/user/#{user.id}") #admin view for the profile page
      expect(page).to have_field("Disabled", checked: true)
    end
  end

  context "enables a disabled user account" do
    it "changes the status of a user to enabled" do
      visit "/admin/user/#{user.id}" #admin view for the profile page
      expect(page).to have_field("Enabled", checked: false)

      find(:css, ".enable").set(true)
      click_on "Save"

      expect(current_path).to eq("/admin/user/#{user.id}") #admin view for the profile page
      expect(page).to have_field("Enabled", checked: true)
    end
  end
end

# An Admin can disable user account
# As an admin
# When I visit a user show page (/admin/user/:id)
# And I select ‘disabled’ in the status radio buttons
# And I click on Save
# The user has a status of disabled

# An Admin can enable a disabled user account
# As an admin
# When I visit a user show page (/admin/user/:id)
# And I select ‘enabled’ in the status radio buttons
# And I click on Save
# The user has a status of enabled