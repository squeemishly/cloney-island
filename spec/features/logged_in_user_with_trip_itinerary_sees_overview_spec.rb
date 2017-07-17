# require 'rails_helper'

# RSpec.feature "logged in user" do
#   it "with trip itinerary can see overview" do
#     before(:each) do
#       allow_any_instance_of(ApplicationController).to recieve(current_user).and_return(user)
#     end
#     user = create(:user)
#     attractions = create_list(:attraction, 10)
#     itinerary = create(:itinerary)
#     itinerary.attractions << attractions
#     user.itineraries << itinerary

#     visit root_path
#     click_on "Trip Overview"

#     expect(current_path).to eq(itineraries_path(itinerary.id))
#     expect(page).to have_selector(".map")

#     #test for JS stuff

#     expect(page).to have_content("Trip Dates")
#   end
# end
# # 18. Logged In User with Trip Itinerary Can See Overview
# # As a logged in user,
# # When I click on “Trip Overview”
# # Then I see a map
# # And I see all of the places on my itinerary on the map
# # And I do not to see other places displayed on the map
# # And I see my trip dates
