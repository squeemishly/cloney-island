require 'rspec'

feature "user signs in" do
  context "they have saved trips" do
    it "they see a prompt asking them to create a new trip or choose an existing trip" do

      user = create(:user_with_trips, 1)
      visit root_path
      click_on "Sign In"

      expect(page).to have_content("Sign In with Google")
      expect(page).to have_content("Sign In with Google")
      expect(page).to have_content("Sign In with Email")

      click_on "Sign In with Email"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_on "Sign In"

      # And I am redirected to a prompt page asking to make a new trip or add to
      # existing trip
      # What path should this be? A partial on the display trips page?

      expect(page).to have_content("Create New Trip")
      expect(page).to have_content("Choose Existing Trip")
    end
  end
end

