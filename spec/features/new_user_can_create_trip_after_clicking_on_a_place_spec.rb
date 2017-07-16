require 'rails_helper'

RSpec.describe "user can create a trip" do
  it "after clicking on a place" do
    place = create(:place, name: "Denver")
    start_date = "07-10-2017"
    end_date = "07-11-2017"

    visit root_path
    click_on "Denver"
    within first(".place-preview") do
      page.find(".place-preview-name").click
    end

    expect(current_path).to eq(login_path)
    click_on "Create an Account with Email"


    fill_in "First Name", with: "Finn"
    fill_in "Last Name", with: "the Human"
    fill_in "Email", with: "here@here.com"
    fill_in "Phone Number", with: "555-555-5555"
    fill_in "Password", with: "password"
    click_on "Sign Up"

    expect(current_path).to eq(new_trip_path)
    expect(page).to have_content(city.name)

    fill_in "Start Date", with: start_date
    fill_in "End Date", with: end_date
    click_on "Create New Trip"

    expect(current_path).to eq(place_path(place.id))
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
