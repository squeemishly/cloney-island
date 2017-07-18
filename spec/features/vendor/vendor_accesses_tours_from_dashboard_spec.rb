require 'rails_helper'

feature "Vendor clicks on all tours from dashboard" do
  before :each do
    @vendor = create(:user_with_tours, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@vendor)
    tour1 = @vendor.tours.first
  end

  it "see their tours" do
    visit user_vendor_dashboard_path(@vendor)
    click_on "View All Tours"
  end

# click_on "View All Tours"

#     expect(page).to have_selector('.tour', count: @vendor.tours.count)
#     expect(page).to have_content(tour1.name)
#     expect(page).to have_content(tour1.price)
#     expect(page).to have_content(tour1.avg_rating)
#     expect(page).to have_content("Edit")
#     expect(page).to have_content("Delete")