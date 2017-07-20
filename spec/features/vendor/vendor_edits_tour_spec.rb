require 'rails_helper'

feature "Vendor edits their tour" do
  before :each do
    @vendor = create(:user_with_tours, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@vendor)
    @tour = @vendor.tours.first
  end

  context "edits their own tour from the dashboard" do
    it "they click edit and fill out form" do
      visit user_vendor_dashboard_path(@vendor)

      within first('.tour') do
        click_on "Edit"
      end

      expect(current_path).to eq(edit_user_vendor_tour_path(@vendor, @tour))

      fill_in "tour_name", with: "different name"
      fill_in "tour_description", with: "new description"
      fill_in "tour_price", with: "$99,999.23"
      click_on "Update Tour"

      expect(current_path).to eq(user_vendor_tour_path(@vendor, @tour))

      expect(page).to have_content("different name")
      expect(page).to have_content("new description")
      expect(page).to have_content("$99,999.23")
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end

  context "edits their own tour from the show page" do
    it "they click edit and fill out form" do
      visit user_vendor_tour_path(@vendor, @tour)
      click_on "Edit"

      expect(current_path).to eq(edit_user_vendor_tour_path(@vendor, @tour))

      fill_in "tour_name", with: "definitely a different name"
      fill_in "tour_description", with: "an extra new description"
      fill_in "tour_price", with: "$3.50"
      click_on "Update Tour"

      expect(current_path).to eq(user_vendor_tour_path(@vendor, @tour))

      expect(page).to have_content("definitely a different name")
      expect(page).to have_content("an extra new description")
      expect(page).to have_content("$3.50")
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end

  context "tries to edit another vendor's tour from the show page" do
    it "there is no edit button on the show page" do
      vendor2 = create(:user_with_tours, role: 1)
      tour2 = vendor2.tours.first

      visit user_vendor_tour_path(vendor2, tour2)

      expect(page).to have_content(tour2.name)
      expect(page).to_not have_content("Edit")
    end
  end
end

# As a vendor
# When i visit vendor/id/dashboard
# I click on “edit”
# It redirects me to an edit form (vendors/id/tours/id/edit)
# I change something
# I click on “update”
# It redirects me to /tour/id/ (show page)
# I see my changes
