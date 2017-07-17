# require 'rails_helper'

# RSpec.describe "A user can view the tour index page" do
#   it "can view a list of tours on the tour index page" do
#      user = create(:user)
#      tour1 = create(:tour)
#      vendor = create(:user)

#      visit root_path

#      click_on 'Sign In Using Email'
#      fill_in 'Email', with: "#{user.email}"
#      fill_in 'Password', with: 'password'
#      click_on "Sign in"
#      click_on "Tours"
#      click_on "#{vendor.name}"

#      expect(current_path).to eq(tours_path)

#      click_on "#{tour1.name}"

#      expect(current_path).to eq("/tours/#{tour1.id}")
#      expect(page).to have_content(tour1.name)
#      expect(page).to have_content(tour1.price)
#      expect(page).to have_content(tour1.description)
#      expect(page).to have_content(tour1.avg_rating)
#      expect(page).to have_content("Leave A Review")
#      expect(page).to have_content("Reviews For #{tour1.name}")
#    end
#  end

# # 31. A logged in user can see a specific tour (show)
# # As a logged in user
# # When I click on a tour
# # Then it redirects me to /tours/id/
# # And I see:
# # A picture
# # A tour name
# # A tour vendor name
# # A tour price
# # A tour description
# # And average stars
# # A review box (form) --- should have username, stars, description, title
# # 5 latest reviews
