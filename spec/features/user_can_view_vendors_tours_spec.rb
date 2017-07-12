require 'rails_helper'

RSpec.describe "A signed-in user can view all tours from one vendor" do
  it "can view all tours from a vendor" do
    user = create(:user)
    vendor = create(:user)
    tour1 = create(:tour)
    tour2 = create(:tour)

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    click_on "Sign in"

    click_on "Tours"
    click_on "#{vendor.name}"

    expect(current_path).to eq("/vendors/#{vendor.id}/tours")
    expect(page).to have_content(vendor.name)
    expect(page).to have_content(tour1.name)
    expect(page).to have_content(tour2.name)
  end
end
