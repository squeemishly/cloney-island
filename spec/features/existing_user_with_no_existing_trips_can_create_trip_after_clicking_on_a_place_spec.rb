require 'rails_helper'

RSpec.describe "existing user creates trip" do
  it "creates a trip after clicking on a place" do
    user = create(:user, password: "password")
    place = create(:place, name: "Denver")
    start_date = "07-10-2017"
    end_date = "07-11-2017"

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Sign In"

    expect(current_path).to eq(new_trip_path)
    expect(page).to have_content(city.name)

    fill_in "Start Date", with: start_date
    fill_in "End Date", with: end_date
    click_on "Create New Trip"

    expect(current_path).to eq(place_path(place.id))
  end
end

# # 11. An existing user with no trips can create a trip after clicking on a place
# # As an existing user
# # After signing in
# # I see new trip form
# # With location already filled in with location of attraction I clicked on
# # I fill in
# # -start date
# # -end date
# # -place of arrival*
# # -accommodations*
# # I click on “create new trip”
# # I am redirected to place page of the place that I clicked on before
# #
# # *if we wanna go spicy
