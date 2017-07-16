require 'rails_helper'

RSpec.describe "A user can reset their password via text message" do
  it "can reset their password via text message" do
    user = create(:user)

    visit root_path

    click_on "SIGN IN"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "password"
    find(".btn-sign-in").click
    click_on "Change Password"

    expect(page).to have_content("Verification Code")
    expect(page).to have_content("Confirm")

    expect(page).to have_content("Verification code is correct!")
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
