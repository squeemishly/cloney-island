# require 'rails_helper'

# feature "guest creates account" do
#   context "they fill in form with valid credentials" do
#     it "they see the new trip form" do

#       visit login_path
#       click_on "Create an Account with Email"

#       expect(current_path).to eq(new_user_path)
#       expect(User.count).to eq(0)

#       fill_in "First name", with: "Jimbo"
#       fill_in "Last name", with: "Tron"
#       fill_in "Email", with: "jimbotron@example.com"
#       fill_in "Password", with: "password"
#       fill_in "Confirm Password", with: "password"
#       fill_in "Phone", with: "303-555-5555"
#       click_on "Sign Up"

#       expect(User.count).to eq(1)
#       expect(current_path).to eq(new_user_trip_path(User.first))
#     end
#   end

#   context "they fill in form with invalid credentials" do
#     it "they see the new user form and a flash message" do
#       visit login_path
#       click_on "Create an Account with Email"

#       expect(current_path).to eq(new_user_path)
#       expect(User.count).to eq(0)

#       fill_in "First name", with: "Jimbo"
#       fill_in "Last name", with: "Tron"
#       fill_in "Email", with: "jimbotron@example.com"
#       fill_in "Password", with: "password"
#       fill_in "Confirm Password", with: "wrong"
#       fill_in "Phone", with: "303-555-5555"
#       click_on "Sign Up"

#       expect(User.count).to eq(0)
#       expect(current_path).to eq(new_user_path)
#       expect(page).to have_content("User creation failed. Please try again")
#     end
#   end
# end
