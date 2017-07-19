require 'rails_helper'

feature "Vendor accesses all tours" do
  before :each do
    @vendor = create(:user_with_tours, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@vendor)
    tour1 = @vendor.tours.first
  end

  context "click on view all tours from dashboard" do
    it "see their tours" do
      visit user_vendor_dashboard_path(@vendor)
      click_on "View All Tours"

      expect(page).to have_selector('.tour', count: @vendor.tours.count)
      expect(page).to have_content(tour1.name)
      expect(page).to have_content(tour1.price)
      expect(page).to have_content(tour1.avg_rating)
    end
  end

    context "click on tours on navbar" do
    it "see their tours" do
      visit user_vendor_dashboard_path(@vendor)
      find('.user-avatar').click
      find('.my-tours').click

      expect(page).to have_selector('.tour', count: @vendor.tours.count)
      expect(page).to have_content(tour1.name)
      expect(page).to have_content(tour1.price)
      expect(page).to have_content(tour1.avg_rating)
    end
  end
