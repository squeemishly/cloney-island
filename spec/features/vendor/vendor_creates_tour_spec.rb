require 'rails_helper'

RSpec.describe "Vendor" do
  it "creates a tour" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(vendor)
    vendor = create(:user)
    # vendor = User.create(first_name: "name", last_name: "lastname", email: "email@email.com", phone: "(012) 345 6789", password: "password")
    role = create(:role, name: "vendor")
    vendor.roles << role

    visit "/vendor/dashboard"
    click_on "New Tour"

    expect(current_path).to eq("/tours/new") #check paths

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
