# require 'rails_helper'

# RSpec.describe "A user can view the tour index page" do
#   it "can view a list of tours on the tour index page" do
#      user = create(:user)
#      tour1 = create(:tour)
#      tour2 = create(:tour)

#      visit root_path

#      click_on 'Sign In Using Email'
#      fill_in 'Email', with: "#{user.email}"
#      fill_in 'Password', with: 'password'
#      click_on "Sign in"
#      click_on "Tours"

#      expect(current_path).to eq(tours_path)
#      expect(page).to have_content(tour1.name)
#      expect(page).to have_content(tour1.description)
#      expect(page).to have_content(tour1.price)
#      expect(page).to have_content(tour1.avg_rating)
#      expect(page).to have_content(tour2.name)
#      expect(page).to have_content(tour2.description)
#      expect(page).to have_content(tour2.price)
#      expect(page).to have_content(tour2.avg_rating)
#   end
# end

# # 30. A logged in user can see all tours (index)
# # As a logged in user
# # When I click on ‘tours’ on the first navbar
# # Then it redirects me to /tours/index
# # And I see:
# # A thumbnail picture
# # A tour name
# # A tour vendor name
# # A tour price
# # A tour description
# # And average stars
