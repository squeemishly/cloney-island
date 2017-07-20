require 'rails_helper'

RSpec.describe "a user can create a trip" do
  it "by clicking on the New Trip button" do
    VCR.use_cassette("a_user_create_a_trip") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "New Trip"

      expect(current_path).to eq new_user_trip_path(user)

      expect(Trip.count).to eq 0
      expect(City.count).to eq 0
      fill_in "Location", with: "Beijing"
      fill_in "Start Date", with: "2018-10-28"
      fill_in "End Date", with: "2018-11-28"
      click_on "Create Trip"

      expect(Trip.count).to eq 1
      expect(City.count).to eq 1
      expect(current_path).to eq '/search'
    end
  end
end
