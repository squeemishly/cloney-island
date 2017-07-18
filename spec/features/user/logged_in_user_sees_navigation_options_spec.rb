require 'rails_helper'

RSpec.describe "a logged in user" do

  it "sees navigation options" do

  user = create(:user, password: "password")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   date = Date.today

   visit user_trips_path(user.id)

   click_on "Create New Trip"
   expect(page).to have_content("Start Date")
   expect(page).to have_content("End Date")
   expect(page).to have_button("Create Trip")
   expect(page).to have_content("Attractions")
  end
end

# # 13. Logged in user sees navigation options
# # As a logged in user,
# # When I create a new trip,
# # I expect to see the ‘current day’ displayed on the nav bar
# # And I expect to see a “daily plan” button on the second nav bar
# # And I expect to see a “Attractions” button on the second nav bar
