# require 'rails_helper'

# RSpec.describe "A guest user cannot sign in with invalid credentials" do
#   it "cannot sign in with invalid credentials" do

#     #########################################
#     # I think this is tested in user_signs_in_and_must_select_trip_spec:
#     ##########################################

#     visit root_path

#     click_on 'Sign In Using Email'
#     fill_in 'Email', with: 'invalid@email.com'
#     fill_in 'Password', with: 'wrongword'
#     click_on "Sign in"

#     expect(current_path).to eq('/')
#     expect(current_page).to have_content("Invalid account information, please try again.")
#   end
# end

# 29. A user tries to sign in with invalid credentials
# As a guest
# When I click on “sign in”
# And I fill in the email field with an email that isn’t in the database
# And I fill in the password field
# And I click on sign in
# Then I am redirected to the sign in page
# And I see a flash message informing me my sign in failed
