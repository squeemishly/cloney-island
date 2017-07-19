require 'rails_helper'

RSpec.describe "logged in user with existing trip" do
  it "can add a place to a trip" do
    VCR.use_cassette("logged_in_user_can_add_a_place_to_a_trip") do
      user = create(:user, password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      city = City.create(name: "Beijing",
                        lat: 39.9041999,
                        lng: 116.4073963,
                        place_id: "ChIJuSwU55ZS8DURiqkPryBWYrk")

      trip = create(:trip, city: city)

      user.trips << trip

      visit user_trip_path(user, trip)
      click_on "Edit Trip"

      expect(trip.itineraries.count).to eq 0
      within first(".attraction-preview") do
        find(".add-attraction-button").click
      end

      expect(trip.itineraries.count).to eq 1
      # expect(page).to have_content "Attraction has been added to your trip"
    end
  end
end

# 14. Logged in user with an existing trip adds a place to a trip
# As a logged in user,
# When I create a trip
# Then I expect to see a list of places
# And I expect to see an “add” button on each place
# And when I press the “Add” button,
# Then I expect to see a message that confirms that the place was added to the current day’s itinerary.


# 14. Logged in user with an existing trip adds a place to a trip
# As a logged in user,
# When I create a trip
# Then I expect to see a list of places
# And I expect to see an “add” button on each place
# And when I press the “Add” button,
# Then I expect to see a message that confirms that the place was added to the current day’s itinerary.
