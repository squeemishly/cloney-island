require 'rails_helper'

RSpec.describe "A signed-in user can view a list of their planned trips" do
  it "can view a list of planned trips" do
    user = create(:user)
    trip1 = create(:trip)
    trip2 = create(:trip, start_city: "Constantinople")
    user.trips << trip1
    user.trips << trip2

    visit root_path

    click_on 'Sign In'

    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    find(".btn-sign-in").click

    find('.user-avatar').click
    click_on "My Trips"

    expect(current_path).to eq(user_trips_path(user))
    expect(page).to have_content("My Trips")

    within first(".my-trip-list") do
      # expect(page).to have_css("div.trip-city-pic")
      expect(page).to have_content(trip1.start_date)
      expect(page).to have_content(trip1.end_date)
      expect(page).to have_content(trip1.start_city)
    end

    expect(page).to have_content(trip2.start_date)
    expect(page).to have_content(trip2.end_date)
    expect(page).to have_content(trip2.start_city)

    click_on trip1.start_city

    expect(page).to have_content "Itinerary for #{trip1.start_city}"
    expect(page).to have_content "FROM: #{trip1.start_date} - #{trip1.end_date}"
    expect(current_path).to eq user_trip_path(user, trip1)

    expect(page).to_not have_content trip2.start_city
  end
end

#23. Logged in user can see a list of all planned trips

# As a logged in user
# When I visit “My Trips”
# Then I see each of my saved trips displayed
# And each trip has a photo
# And each trip has a title
# And each trip has the first date, a dash, and the end date
# When I click on one of the trips
# Then I will be redirected to the “Trip Overview” page associated with that trip.
