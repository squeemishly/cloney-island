require 'rails_helper'

RSpec.describe "A user can reset their password via text message" do
  it "can reset their password via text message" do
    user = create(:user)

    visit root_path

    click_on "Sign In"
    click_on "Forgot Password"

    fill_in "Email", with: "#{user.email}"
    click_on "Get My Password"

    expect(page).to have_content("Enter SMS code:")
    expect(page).to have_content("Reset Password:")
    expect(page).to have_content("Confirm Password:")
    fill_in "SMS Code", with: #ENTER CODE HERE
    fill_in "Reset Password", with: #ENTER NEW PASSWORD HERE
    fill_in "Confirm Password", with: #ENTER NEW PASSWORD HERE
    click_on "Save Changes"

    expect(page).to have_content("Your password has been successfully reset!")
  end
end
