# require 'rails_helper'
#
# RSpec.describe "user can create a trip" do
#   it "after clicking on a place" do
#     VCR.use_cassette("creating a trip") do
#
#       city = create(:city)
#       visit "/search?city=#{city.id}"
#
#       within (".column-list") do
#         first(".attraction-preview-link").click
#       end
#
#       expect(current_path).to eq(search_path)
#       find(".add-attraction-button").click
#
#       click_on "Create an Account with Email"
#
#       # save_and_open_page
#       fill_in "First name", with: "Finn"
#       fill_in "Last name", with: "the Human"
#       fill_in "Email", with: "here@here.com"
#       fill_in "Password", with: "password"
#       fill_in "Confirm Password", with: "password"
#       fill_in "Phone", with: "+15555555555"
#       click_on "Sign Up"
#
#       expect(current_path).to eq(new_user_trip_path(#we have no user...?))
#       expect(page).to have_content(city.name)
#
#       fill_in "Start Date", with: "2017-08-30"
#       fill_in "End Date", with: "2017-09-16"
#       click_on "Create New Trip"
#
#       expect(current_path).to eq("/search?city=#{city.id}")
#     end
#   end
# end
#
# #NEED THE BUTTON TO FUNCTION BEFORE CAN FINISH TEST
#
#
# # # 10. A new user can create a trip after clicking on a place
# # # As a new user
# # # After creating an account
# # # I see new trip form
# # # With location already filled in with location of attraction I clicked on
# # # I fill in
# # # -start date
# # # -end date
# # # -place of arrival*
# # # -accommodations*
# # # I click on “create new trip”
# # # I am redirected to place page of the place that I clicked on before
# # #
# # # *if we wanna go spicy
