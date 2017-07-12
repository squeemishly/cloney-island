require 'rails_helper'

Rspec.describe "Admin" do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    admin = create(:user)
    user = create(:user)
    role = create(:role, name: "admin")
    admin.roles << role
  end

  it "assigns vendor role to user" do
    visit "/admin/user/#{user.id}" #admin view for the profile page
    expect(page).to have_field("Vendor", checked: false)

    find(:css, ".vendor").set(true)
    click_on "Save"

    expect(current_path).to eq("/admin/user/#{user.id}") #admin view for the profile page
    expect(page).to have_field("Vendor", checked: true)
  end
end


# As an admin
# When I visit a user show page (/admin/user/:id)
# And I check ‘vendor’ in the roles checkboxes
# And I click on Save
# The user has the vendor role added to their profile
