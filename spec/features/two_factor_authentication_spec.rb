require 'rails_helper'

RSpec.describe "Two-factor authentication" do
  context "allows users to reset a password" do
    let(:fake_verification_code) { "123456" }

    it "when they are logged in" do
      allow(CodeGenerator).to receive(:generate).and_return(fake_verification_code)

      user = create(:user)
      visit root_path

      click_on "Sign In"
      fill_in "Email", with: "#{user.email}"
      fill_in "Password", with: "password"
      find(".btn-sign-in").click
      click_on "My Account"

      VCR.use_cassette("twilio-accounts-messages") do
        click_on "Change Password"
      end

      expect(page).to have_content("Verification Code")
      expect(page).to have_button("Confirm")

      fill_in "verification_code", with: fake_verification_code
      click_button "Confirm"

      expect(page).to have_content("Verification code is correct!")
    end

    it "when they are logged out" do
      allow(CodeGenerator).to receive(:generate).and_return(fake_verification_code)

      user = create(:user)
      visit root_path

      click_on "Sign In"
      expect(page).to have_css('.email-field')
      fill_in "email-field", with: "#{user.email}"
      click_button "Send SMS"

      expect(page).to have_content("Verification Code")
      expect(page).to have_button("Confirm")

      fill_in "verification_code", with: fake_verification_code
      click_button "Confirm"

      expect(page).to have_content("Verification code is correct!")
    end
  end
end
