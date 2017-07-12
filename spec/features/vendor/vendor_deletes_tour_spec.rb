require 'rails_helper'

Rspec.describe "Vendor" do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)
    vendor = create(:user_with_tours)
    role = create(:role, name: "vendor")
    vendor.roles << role
    tour1 = vendor.tours.first
    # tour1 = create(:tour_with_rating) #??
    # vendor.tours << tour1
  end

  context "deletes a tour" do
    scenario "from the dashboard" do
      visit "/vendor/dashboard"
      click_on "Delete"

      expect(flash[:alert]).to match(/Are you sure you want to delete this?*/)
      click_on "Yes"

      expect(current_path).to eq("/vendor/#{vendor.id}") #check paths

      expect(page).to_not have_content(tour1.name)
      expect(page).to_not have_content(tour1.description)
      expect(page).to_not have_content(tour1.price)
    end

    scenario "from the show page" do
      visit "/vendor/#{vendor.id}/tours/#{tour1.id}"
      click_on "Delete"

      expect(flash[:alert]).to match(/Are you sure you want to delete this?*/)
      click_on "Yes"

      expect(current_path).to eq("/vendor/#{vendor.id}") #check paths

      expect(page).to_not have_content(tour1.name)
      expect(page).to_not have_content(tour1.description)
      expect(page).to_not have_content(tour1.price)
    end
  end

  it "can't delete other vendor's tours" do
    vendor2 = create(:user_with_tours)
    role = create(:role, name: "vendor")
    vendor2.roles << role
    tour2 = vendor2.tours.first

    visit "/vendor/#{vendor2.id}/tours/#{tour2.id}"

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
