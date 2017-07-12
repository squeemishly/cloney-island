require 'rails_helper'

RSpec.describe "A signed-in user can update a trip" do
  it "can update a trip after signing in" do
    user = create(:user)
    trip1 = create(:trip)
    place1 = create(:place)

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    click_on "Sign in"
    select('My Trips', :from => 'Select Box')

    expect(current_path).to eq(trips_path)
    expect(page).to have_content("My Trips")
    expect(page).to have_content(trip1.title)
    expect(page).to have_content(trip1.start_date)
    expect(page).to have_content(trip1.end_date)
    expect(page).to have_content(trip1.start_city)

    click_on "Edit Trip"

    #expect(current_path).to eq(trip_path)
    expect(page).to have_content(place1.name)
    expect(page).to have_content(place1.description)

    click_on "+"
    select('My Trips', :from => 'Select Box')

    expect(current_path).to eq(trips_path)
    expect(page).to have_content("My Trips")
    expect(page).to have_content(trip1.title)

    click_on "Edit Trip"

    expect(page).to have_content(place1.name)
  end
end
