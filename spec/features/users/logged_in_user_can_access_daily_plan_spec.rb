require 'rails_helper'

RSpec.feature "logged in user" do
  it "with trip itinerary can see overview" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to recieve(current_user).and_return(user)
    end
    user = create(:user)
    attractions = create_list(:attraction, 10)
    itinerary = create(:itinerary)
    itinerary.attractions << attractions
    user.itineraries << itinerary
    day = itineraries.date.first

    visit root_path
    click_on "Trip Overview"
    click_on day

    expect(current_path).to eq(itinerary_path(itinerary))
  end
end
# 19. Logged in User with Trip Itinerary Can Access Daily Plan from Trip Overview
# As a logged in user
# When I click on “Trip Overview”
# And when I click on a trip day
# Then I will be redirected to the ‘daily plan’ for that day
