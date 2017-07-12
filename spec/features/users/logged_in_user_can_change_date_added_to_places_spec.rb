require 'rails_helper'

RSpec.describe "logged in user" do
  it "can change the date adding to places" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(current_user).and_return(user)
    end
    user = create(:user)
    trip = create(:trip)
    date2 = 07-10-2017
    date1 = 07-11-2017
    user.trip < trip

    visit edit_trips_path(trip.id)
    expect(page).to have_content(date1)
    click_on "Current Day"
    page.should have_css('date-dropdown')
    within(".date-dropdown") do
      click_on "07-11-2017"
    end
    expect(page).to_not have_content(date1)
    expect(page).to have_content(date2)

    click_on "Add"
    expect(flash[:success]).to be_present
  end
end

# 15. As a logged in user I can change the date I’m adding places to
# As a logged in user,
# When I am editing a trip
# Then I see the ‘current day’ displayed on the nav bar
# And when I click on the current day, I see a dropdown menu of other days in the trip
#
# When I click on a different day,
# Then I see that the ‘current day’ button is updated
# And when I press the “Add” button,
# Then I see a flash message that confirms that the place was added to the current day’s itinerary.
