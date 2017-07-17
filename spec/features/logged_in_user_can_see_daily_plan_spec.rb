# require 'rails_helper'

# RSpec.describe "logged in user" do
#   before(:each) do
#     allow_any_instance_of(ApplicationController).to recieve(current_user).and_return(user)
#   end
#   it "can see daily plan" do
#     user = create(:user)
#     trip = create(:trip)
#     attractions = create_list(:attraction, 10)
#     date = 07-10-2017
#     trip.itineraries.places << places
#     user.trips << trip

#     visit trips_path(trip.id)
#     click_on "Daily Plan"

#     within (".attraction-preview") do
#       expect(page).to have_content(date)
#       expect(attractions.count).to eq(3)
#       expect(page).to have_content(attraction[0].attraction_image)
#       expect(page).to have_content(attraction[0].name)
#     end
#     #javascript expectations
#   end
# end


# # 16. Logged In User Can See Daily Plan
# # As a logged in user,
# # When I create a new trip,
# # And when I add places to the trip
# # And when I click on “Daily Plan”
# # Then I see the ‘current day’ date displayed on side bar
# # And I see a list of the places I selected under the date
# # A small thumbnail picture of the place
# # The name of the place
# # Ave. time spent
# # And I see those places on the map
# # And I do not see other places displayed on the map
