# require 'rails_helper'

 # RSpec.describe "a logged in user" do
 #   it "sees navigation options" do
 #     before(:each) do
 #      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
 #    end
 #    user = create(:user, password: "password")
 #    places = create_list(:place, 10)
 #    place1 = place.first
 #    date = Date.today

 #    visit user_dashboard_path(user.id)

 #    click_on "Create New Trip"
 #    expect(page).to have_content("Current Day")
 #    expect(page).to have_button("Daily Plan")
 #    expect(page).to have_button("Places")
 #    expect(page).to have_selector(".place", 10)
 #    within first(".place") do
 #      expect(page).to have_content(place.name)
 #      expect(page).to have_content(place.description)
 #      expect(page).to have_content(place.place_image)
 #    end
 #   end
 # end

 # # 13. Logged in user sees navigation options
 # # As a logged in user,
 # # When I create a new trip,
 # # I expect to see the 'current day' displayed on the nav bar
 # # And I expect to see a "daily plan" button on the second nav bar
 # # And I expect to see a "Places" button on the second nav bar
 # # And I expect to see a list of places
