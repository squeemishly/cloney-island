# require 'rails_helper'

# RSpec.describe "A signed-in user can delete their account" do
#   it "can delete their account" do
#     user = create(:user)

#     visit root_path

#     click_on 'Sign In Using Email'
#     fill_in 'Email', with: "#{user.email}"
#     fill_in 'Password', with: 'password'
#     click_on "Sign in"
#     select('My Account', :from => 'Select Box')

#     expect(page).to have_content("Account Information")
#     click_on "Delete Account"

#     expect(page).to have_content("Are you sure you want to delete your account?")
#     click_on "Yes"

#     expect(current_path).to eq("/")

#     click_on 'Sign In Using Email'
#     fill_in 'Email', with: "#{user.email}"
#     fill_in 'Password', with: 'password'
#     click_on "Sign in"

#     expect(page).to have_content("Invalid account information, please try again.")
#   end
# end

# # 25. A registered user can delete their account
# # As a logged in user
# # When I click on the avatar in the upper right hand corner
# # And I click on My Account
# # And I click on Delete Account
# # And I click on OK
# # Then my account will be deleted from the website
# # And I will be redirected to ‘/’
# # And if I try to sign in again, I’ll get a  'invalid account information, try again' message
