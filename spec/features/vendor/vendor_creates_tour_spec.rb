require 'rails_helper'

feature "Vendor creates tour" do
  it "creates a tour" do
    vendor = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)

    visit user_vendor_dashboard_path(vendor)
    click_on "New Tour"

    expect(current_path).to eq(new_user_vendor_tour_path(vendor))

    fill_in "tour_name", with: "tour1"
    fill_in "tour_description", with: "cool"
    fill_in "tour_price", with: 50
    within ('.new-tour-form') { click_on "Create" }

    tour1 = vendor.tours.last

    expect(current_path).to eq(user_vendor_tour_path(vendor, tour1))
    expect(page).to have_content(tour1.name)
    expect(page).to have_content(tour1.description)
    expect(page).to have_content(tour1.price)
    expect(page).to have_content("No reviews yet")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end
end
