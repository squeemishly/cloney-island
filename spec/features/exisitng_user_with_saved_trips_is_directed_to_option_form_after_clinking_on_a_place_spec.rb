require 'rails_helper'

RSpec.describe "existing user with saved trips" do
  it "is directed to an option form after clicking on a place" do
    user = create(:user)
    place = create(:place, name: "Botanic Gardens")
    city = create(:city, name: "Denver")
    trip = create_list(:trip, 2)
    trip1 = trip.first
    place.city_id = city.id
    user.trips << trip

    visit root_path
    click_on "Denver"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"

    expect(current_path).to eq(user_trips_path(user.id))
    expect(page).to have_content("Create New Trip")
    expect(page).to have_content("Choose Existing Trip")
    expect(user.trips.count).to eq(2)
    expect(page).to have_content(trip1.start_city.name)
    expect(page).to have_selector(".city-image")
    expect(page).to have_content(trip1.start_date)
    expect(page).to have_content(trip1.end_date)
    expect(current_path).to eq(place_path(place.id))

  end
end



# 12. An existing user with saved trips is directed to an option form after clicking on a place
# After signing in
# I see form
# That asks if I want to create a trip or choose an existing trip
# And I see a list of all existing trip to that city
# And I see
# -name of city,
# -picture of city
# -existing travel dates associated with that “trip”
# And I click on a trip
# And I am redirected to the place page
