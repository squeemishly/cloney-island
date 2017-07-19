require 'rails_helper'

feature "guest prompted to sign in before creating trip" do
  context "they are not logged in" do
    it "they see a sign in prompt after clicking on add attraction button" do
      VCR.use_cassette("guest_signs_in_for_trip") do
        city = create(:city)
        visit root_path

        within (".column-list") do
          first("a").click
        end

        within first(".attraction-preview") do
          find(".add-attraction-button").click
        end

        expect(current_path).to eq(login_path)
        expect(page).to have_content("You must sign in or create an account to create a trip")
        expect(page).to have_content("Sign In")
        expect(page).to have_content("Create an Account with Email")
      end
    end
  end
end
