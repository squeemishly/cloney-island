require 'rails_helper'

RSpec.describe "a user can edit a trip" do
  it "and see the city the trip starts in" do
    VCR.use_cassette("user_edits_a_trip") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      trip = create(:trip)
      user.trips << trip

      visit user_trips_path(user)
      click_on trip.start_city

      expect(current_path).to eq user_trip_path(user, trip)
      click_on "Edit Trip"
      expect(current_path).to eq "/search"

      within first(".attraction-preview") do
        expect(page).to have_selector(".add-attraction-button")
        expect(page).to have_selector(".attraction-image-container")
        expect(page).to have_selector(".attraction-preview-name")
      end
    end
  end
end
