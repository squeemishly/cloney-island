require 'rails_helper'

RSpec.feature "logged in user" do
  it "sees options with nav-bar" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_selector(".user-avatar")
    page.find(".user-avatar").click
    expect(page).to have_content("My Trips")
    expect(page).to have_content("Plan New Trip")
    expect(page).to have_content("My Account")
    expect(page).to have_content("Sign Out")
  end
end

# # 20. Logged In User Sees Options with Personal Nav-Bar
# # As a logged in user
# # I see my avatar in the top right corner
# # And when I click on my avatar
# # I see a dropdown menu
# # And I expect the drop down menu to include a link for “Plan a new trip”
# # And I expect the drop down menu to include a link for “My Trips”
# # And I expect the drop down menu to include a link for “My Account”
# # And I expect the drop down menu to include a link for “Sign Out”
