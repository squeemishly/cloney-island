require 'rails_helper'

RSpec.describe "Vendor" do
  before :each do
    @vendor = create(:user_with_tours, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@vendor)
    tour1 = @vendor.tours.first
    # tour1 = create(:tour_with_rating) #??
    # vendor.tours << tour1
  end

  it "sees their dashboard" do
    visit user_vendor_dashboard_path(@vendor)

    expect(page).to have_content("New Tour")
    expect(page).to have_content("View All Tours")
    expect(page).to have_content("Manage Tours")

    expect(page).to have_selector('.tour', count: @vendor.tours.count)
    expect(page).to have_content(tour1.name)
    expect(page).to have_content(tour1.price)
    expect(page).to have_content(tour1.avg_rating)
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end

  it "can't see other vendor's dashboard" do
    vendor2 = create(:user, first_name: "other", role: 1)

    visit "/users/#{vendor2.id}/vendor/dashboard"

    expect(page).to have_content "Welcome #{@vendor.first_name}"
    expect(page).to_not have_content "Welcome #{vendor2.first_name}"
  end
end

# As a vendor
# When I visit vendor/dashboard
# I see all my tours
# I see an edit button for each tour
# I see a delete button for each tour
# I see a “new tour” button
