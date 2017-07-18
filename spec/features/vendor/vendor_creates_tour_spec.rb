require 'rails_helper'

feature "Vendor creates tour" do
  it "creates a tour" do
    vendor = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)

    visit vendor_dashboard_path
    click_on "New Tour"

    expect(current_path).to eq(new_vendor_tour_path)

    fill_in "name", with: "tour1"
    fill_in "description", with: "cool"
    fill_in "price", with: 50
    click_on "Create"

    tour1 = vendor.tours.first
    expect(current_path).to eq("/vendor/#{vendor.id}/tours/#{tour1.id}") #check paths

    expect(page).to have_content(tour1.name)
    expect(page).to have_content(tour1.description)
    expect(page).to have_content(tour1.price)
    expect(page).to have_content("This tour doesn't have reviews")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end
end
