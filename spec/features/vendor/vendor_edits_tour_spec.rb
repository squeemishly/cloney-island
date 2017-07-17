# require 'rails_helper'

# RSpec.describe "Vendor" do
#   before :each do
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)
#     vendor = create(:user_with_tours)
#     role = create(:role, name: "vendor")
#     vendor.roles << role
#     tour1 = vendor.tours.first
#     # tour1 = create(:tour_with_rating) #??
#     # vendor.tours << tour1
#   end

#   context "edits a tour" do
#     scenario "from the dashboard" do
#       visit "/vendor/dashboard"
#       click_on "Edit"

#       expect(current_path).to eq("/vendor/#{vendor.id}/tours/#{tour1.id}/edit") #check paths

#       fill_in "name", with: "different name"
#       fill_in "description", with: "new description"
#       fill_in "price", with: 5000
#       click_on "Update"

#       expect(current_path).to eq("/vendor/#{vendor.id}/tours/#{tour1.id}") #check paths

#       expect(page).to have_content("different name")
#       expect(page).to have_content("new description")
#       expect(page).to have_content(5000)
#       expect(page).to have_content("Edit")
#       expect(page).to have_content("Delete")
#     end

#     scenario "from the show page" do
#       visit "/vendor/#{vendor.id}/tours/#{tour1.id}"
#       click_on "Edit"

#       expect(current_path).to eq("/vendor/#{vendor.id}/tours/#{tour1.id}/edit") #check paths

#       fill_in "name", with: "different name"
#       fill_in "description", with: "new description"
#       fill_in "price", with: 5000
#       click_on "Update"

#       expect(current_path).to eq("/vendor/#{vendor.id}/tours/#{tour1.id}") #check paths

#       expect(page).to have_content("different name")
#       expect(page).to have_content("new description")
#       expect(page).to have_content(5000)
#       expect(page).to have_content("Edit")
#       expect(page).to have_content("Delete")
#     end
#   end

#   it "can't edit other vendor's tours" do
#     vendor2 = create(:user_with_tours)
#     role = create(:role, name: "vendor")
#     vendor2.roles << role
#     tour2 = vendor2.tours.first

#     visit "/vendor/#{vendor2.id}/tours/#{tour2.id}"

#     expect(page).to have_content "The page you were looking for doesn't exist."
#   end
# end

# # As a vendor
# # When i visit vendor/id/dashboard
# # I click on “edit”
# # It redirects me to an edit form (vendors/id/tours/id/edit)
# # I change something
# # I click on “update”
# # It redirects me to /tour/id/ (show page)
# # I see my changes
