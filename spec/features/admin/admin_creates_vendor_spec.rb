# require 'rails_helper'

# RSpec.describe "Admin" do
#   before :each do
#     admin = create(:user, role: 2)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#     user = create(:user)
#   end

#   it "assigns vendor role to user" do
#     visit "/admin/user/#{user.id}" #admin view for the profile page
#     expect(page).to have_field("Vendor", checked: false)

#     find(:css, ".vendor").set(true)
#     click_on "Save"

#     expect(current_path).to eq("/admin/user/#{user.id}") #admin view for the profile page
#     expect(page).to have_field("Vendor", checked: true)
#   end
# end


# # As an admin
# # When I visit a user show page (/admin/user/:id)
# # And I check ‘vendor’ in the roles checkboxes
# # And I click on Save
# # The user has the vendor role added to their profile
