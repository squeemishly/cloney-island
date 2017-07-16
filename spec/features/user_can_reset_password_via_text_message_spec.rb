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
    # fill_in "SMS Code", with: #ENTER CODE HERE
    # fill_in "Reset Password", with: #ENTER NEW PASSWORD HERE
    # fill_in "Confirm Password", with: #ENTER NEW PASSWORD HERE
    click_on "Save Changes"

    expect(page).to have_content("Your password has been successfully reset!")
  end
end

# 24. Registered user can reset password with text message confirmation
# As a registered user
# When I forget my password
# When I try to sign in
# Then I can click on “forgot password”
# And I can type in my email address
# And I will receive a text message with a code
# And I can type that code into a code field on the page
# And I will see a field to reset my password
# And I can type in my password
# And I can confirm my password in the password confirm field
# And I can click on Save Changes
# And my password will be updated
