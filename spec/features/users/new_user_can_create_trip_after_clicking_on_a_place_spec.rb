require 'rails_helper'

Rspec.describe "user can create a trip" do
  it "after clicking on a place" do
    user = create(:user, password: "password")
    place = create(:place, name: "Denver")
    start_date = "07-10-2017"
    end_date = "07-11-2017"

    visit root_path
    click_on "Denver"

    expect(current_path).to eq(new_user_path)

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Phone Number", with: user.phone
    fill_in "Password", with: "password"
    click_on "Sign Up"

    expect(current_path).to eq(new_trip_path)
    expect(page).to have_content(place.name)
    expect(page).to have_content(place.description)
    
    fill_in "Start Date", with: start_date
    fill_in "End Date", with: end_date
    click_on "Create New Trip"

    expect(current_path).to eq(place_path(place.id)
  end
end



# 10. A new user can create a trip after clicking on a place
# As a new user
# After creating an account
# I see new trip form
# With location already filled in with location of attraction I clicked on
# I fill in
# -start date
# -end date
# -place of arrival*
# -accommodations*
# I click on “create new trip”
# I am redirected to place page of the place that I clicked on before
#
# *if we wanna go spicy
