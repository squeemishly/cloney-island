require 'rails_helper'

RSpec.describe "A signed-in user can access trips via the navbar" do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   end
  it "can view their trips page from the navbar" do
    user = create(:user_with_trips)

    visit root_path

    expect(page).to have_selector('.user-avatar')
    find('.user-avatar').click
    click_on "My Trips"
    # select("My Trips"), from: ".user-avatar-dropdown"

    expect(current_path).to eq(user_trips_path(user))
    expect(page).to have_content("My Trips")
  end
end

#22. Logged-in user can navigate to my trips page via nav-bar
# As a logged in user
# When I visit the home page
# Then I will see my avatar in the top right corner
# When I click on my avatar
# And then I click on “My trips”
# Then I be redirected to the “My Trips” page
