require 'rails_helper'

feature "guest creates account" do
  context "they fill in form with valid credentials" do
    it "they see the new trip form" do

      visit login_path
      click_on "Create an Account with Email"

      expect(current_path).to eq(new_user_path)

      fill_in "Name", with: "Jimbo"
      fill_in "Email", with: "jimbotron@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"
      fill_in "Phone", with: "303-555-5555"
      click_on "Sign Up"

      expect(current_path).to eq(new_trip_path)
    end
  end

  context "they fill in form with invalid credentials" do
    xit "they see the new user form and a flash message" do
    end
  end
end
