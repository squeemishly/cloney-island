require 'rails_helper'

RSpec.feature "logged in user" do
  it "sees options in the user avatar on the nav-bar" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_selector(".user-avatar")
    page.find(".user-avatar").click
    click_on "Plan New Trip"
    expect(current_path).to eq(new_user_trip_path(user))
  end

  it "can click on New Trip" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on "New Trip"
    expect(current_path).to eq(new_user_trip_path(user))
  end
end

# # 21. Logged In User Can Start New Trip in Nav Bar
# # As a logged in user
# # When I visit the home page
# # Then I see my avatar in the top right corner
# # When I click on my avatar
# # And then I click on “Plan a new trip”
# # Then I will be redirected to the “Plan a New Trip” form
