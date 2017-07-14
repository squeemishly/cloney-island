require 'rails_helper'

feature "user signs in" do
  context "they have saved trips" do
    it "they see a prompt asking them to create a new trip or choose an existing trip" do

      user = create(:user_with_trips)
      visit root_path
      click_on "Sign In"

      expect(page).to have_content("Sign In with Google")
      expect(page).to have_content("Sign In with Facebook")
      expect(page).to have_content("Sign In with Email")

      expect(current_path).to eq(login_path)

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      find(".btn-sign-in").click

      expect(current_path).to eq user_trips_path(user)
      expect(page).to have_content("Create New Trip")
      expect(page).to have_content("Choose Existing Trip")
    end

    it "they enter wrong email and see a flash message" do
      user = create(:user_with_trips)

      visit login_path
      fill_in "Email", with: "wrong@email.com"
      fill_in "Password", with: "password"
      find(".btn-sign-in").click

      expect(current_path).to eq login_path
      expect(page).to have_content("The email or password you entered is incorrect")
    end

    it "they enter wrong password and see a flash message" do
      user = create(:user_with_trips)

      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "wrong"
      find(".btn-sign-in").click

      expect(current_path).to eq login_path
      expect(page).to have_content("The email or password you entered is incorrect")
    end
  end
end

