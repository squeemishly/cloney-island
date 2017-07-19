require 'rails_helper'

 RSpec.describe "A signed-in user can update a trip" do
   it "can update a trip after signing in" do
     VCR.use_cassette("user_can_update_a_trip") do
       user = create(:user)
       trip1 = create(:trip)
       user.trips << trip1

       visit root_path

       click_on 'Sign In'
       fill_in 'Email', with: "#{user.email}"
       fill_in 'Password', with: 'password'
       find(".btn-sign-in").click

       expect(current_path).to eq(user_trips_path(user))
       expect(page).to have_content("My Trips")
       expect(page).to have_content(trip1.start_date)
       expect(page).to have_content(trip1.end_date)
       expect(page).to have_content(trip1.start_city)

       click_on trip1.start_city
       expect(current_path).to eq(user_trip_path(user, trip1))
       click_on "Edit Trip"

       within first(".attraction-preview") do
         find(".add-attraction-button").click
       end

       visit user_trip_path(user, trip1)

       expect(page).to have_selector ".attraction-name"

       #how do I count itinerary items here?
     end
   end
 end

 # 26. Registered User can update a trip
 # As a logged in user
 # When I visit My Trips page
 # And I click on a Trip
 # Then I am redirected to the Trip overview page
 # And I can see the Trip city, dates and map
 #
 # When I can click on Edit Trip
 # Then I am taken back to the map view of that city
 # And I can add more places to the trip
