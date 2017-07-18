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
  end

  xit "can't see other vendor's dashboard" do
    vendor2 = create(:user)
    role = create(:role, name: "vendor")
    vendor2.roles << role

    visit "/vendor/#{vendor2.id}/dashboard"

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end

# As a vendor
# When I visit vendor/dashboard
# I see all my tours
# I see an edit button for each tour
# I see a delete button for each tour
# I see a “new tour” button
