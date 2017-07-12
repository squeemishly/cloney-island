require 'rails_helper'

Rspec.describe "Vendor" do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)
    vendor = create(:user)
    role = create(:role, name: "vendor")
    vendor.roles << role
    tour1 = create(:tour_with_reviews)
    vendor.tours << tour1
    review1 = tour1.reviews.first
    review2 = tour1.reviews.last
  end

  it "sees a tour's reviews" do

    visit "/vendor/#{vendor.id}/tours/#{tour1.id}"

    expect(page).to have_content(review1.title)
    expect(page).to have_content(review1.description)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review2.title)
    expect(page).to have_content(review2.description)
    expect(page).to have_content(review2.rating)
    #add test for order
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end
end
