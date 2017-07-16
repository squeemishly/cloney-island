require 'rails_helper'

RSpec.describe "logged in user" do
  it "can see path of their journey for the day" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to recieve(current_user).and_return(user)
    end
    user = create(:user)
    attraction = create(:attraction)
    user.attractions << attraction
    visit attraction_path(attraction.id)

    #javascript test for seeing trail on map
  end
end
# 17. Logged in user can see the path of their journey for the day
# As a logged in user,
# When I add a place to my Daily Plan
# Then I should see a trail on the map from place to place
