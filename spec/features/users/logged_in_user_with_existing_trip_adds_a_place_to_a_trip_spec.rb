require 'rails_helper'

RSpec.describe "logged in user with existing trip" do
  it "can add a place to a trip" do
    before(:each) do
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   end
   user = create(:user, password: "password")
   trip = create(:trip)
   user.trips << trip

   visit trips_path(trip.id)

   expect(page).to have_selector(".place", count: 10)
   within first(".place-preview") do
     expect(page).to have_selector(".place-preview-img")
     expect(page).to have_selector(".place-preview-name")
     expect(page).to have_selector(".place-preview-description")
     expect(page).to have_selector(".add-attraction-button")
     find("add-attraction-button").click
   end
   expect(flash[:success]).to be_present
  end
end

# 14. Logged in user with an existing trip adds a place to a trip
# As a logged in user,
# When I create a trip
# Then I expect to see a list of places
# And I expect to see an “add” button on each place
# And when I press the “Add” button,
# Then I expect to see a message that confirms that the place was added to the current day’s itinerary.
