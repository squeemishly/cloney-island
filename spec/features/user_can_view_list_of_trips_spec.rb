require 'rails_helper'

RSpec.describe "A signed-in user can view a list of their planned trips" do
  it "can view a list of planned trips" do
    user = create(:user)
    trip1 = create(:trip)
    trip2 = create(:trip)

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
    expect(page).to have_content(trip2.title)
    expect(page).to have_content(trip2.start_date)
    expect(page).to have_content(trip2.end_date)
    expect(page).to have_content(trip2.start_city)

    click_on "#{trip1.name}"
    expect(current_path).to eq(trip_path)
  end
end
