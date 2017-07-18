# require 'rails_helper'

# RSpec.describe "A signed-in user can review a vendor's tours" do
#   it "can review a vendor's tours" do
#     user = create(:user)
#     tour1 = create(:tour)
#     review = create(:review)

#     visit root_path

#     click_on 'Sign In Using Email'
#     fill_in 'Email', with: "#{user.email}"
#     fill_in 'Password', with: 'password'
#     click_on "Sign in"
#     click_on "Tours"
#     click_on "#{vendor.name}"

#     expect(current_path).to eq(tours_path)

#     click_on "#{tour1.name}"

#     expect(current_path).to eq("/tours/#{tour1.id}")
#     expect(page).to have_content("Leave A Review")

#     fill_in 'Title', with: "#{review.title}"
#     fill_in 'Description', with: "#{review.description}"
#     #SELECT STAR RATING
#     expect(page).to have_content("Reviews For #{tour1.name}")
#     expect(page).to have_content("#{user.name}")
#     #EXPECT STAR RATING TO BE LESS OR MORE
#   end
# end

# # 33. A user can review vendors tours
# # As a logged in user
# # When I visit a specific tour
# # And I fill in the review form
# # And I click on submit
# # Then I see my review at the top of the reviews
# # And I see average stars updated to reflect my review
