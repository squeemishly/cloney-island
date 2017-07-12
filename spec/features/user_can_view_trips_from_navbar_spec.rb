require 'rails_helper'

RSpec.describe "A signed-in user can access trips via the navbar" do
  it "can view their trips page from the navbar" do
    user = create(:user)

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    click_on "Sign in"

    expect(page).to have_content(AVATAR IMAGE)

    select('My Trips', :from => 'Select Box')

    expect(current_path).to eq(trips_path)
    expect(page).to have_content("My Trips")
  end
end
