require 'rails_helper'

RSpec.feature "logged in user" do
  it "sees options with nav-bar" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to recieve(current_user).and_return(user)
    end

    visit root_path
    visit root_path
    expect(page).to have_selector(".user-avatar")
    page.find(".user-avatar").click
    page.find("Plan New Trip").click
    expect(current_path).to eq(new_trips_path)
  end
end

# 21. Logged In User Can Start New Trip in Nav Bar
# As a logged in user
# When I visit the home page
# Then I see my avatar in the top right corner
# When I click on my avatar
# And then I click on “Plan a new trip”
# Then I will be redirected to the “Plan a New Trip” form
