require 'rails_helper'

RSpec.describe "A signed-in user can visit their profile from the navbar" do
  it "can visit their profile from the navbar" do
    user = create(:user)

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    click_on "Sign in"
    select('My Account', :from => 'Select Box')

    expect(current_path).to eq('/user/dashboard')
    expect(page).to have_content("#{user.name}'s Account")
  end
end

# 27. A logged in user can visit profile from navbar
# As a logged in user
# When I click on my avatar
# And then I click on My Account
# Then I will be redirected to a user dashboard
