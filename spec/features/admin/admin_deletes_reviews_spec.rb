# require 'rails_helper'

# RSpec.describe "Admin" do
#   before :each do
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#     admin = create(:user)
#     vendor = create(:user)
#     tour1 = user.tours.first
#     role = create(:role, name: "admin")
#     admin.roles << role
#     role = create(:role, name: "vendor")
#     vendor.roles << role
#     tour1 = create(:tour_with_reviews)
#     vendor.tours << tour1
#     review1 = tour1.reviews.first
#   end

#   it "deletes a comment" do
#     visit "/admin/user/#{vendor.id}"
#     click_on tour1.name

#     expect(current_path).to eq("/admin/user/#{vendor.id}/tours/#{tour1.id}")
#     expect(page).to have_content(tour1.name)
#     expect(page).to have_content(tour1.description)
#     expect(page).to have_content(tour1.price)
#     expect(page).to have_content(tour1.avg_rating)
#     expect(page).to have_content(review1.description)
#     expect(page).to have_content("Delete")

#     click_on "Delete"

#     expect(page).to_not have_content(review1.description)
#   end
# end

# # As an admin
# # When I visit /admin/user/:id/
# # I see all their tours
# # I click a specific tour
# # And I should see on the page
# # Tour name, description, price, avg rating and reviews
# # I should see next to each review a delete button
# # when I click it
# # I should no longer see that specific review
