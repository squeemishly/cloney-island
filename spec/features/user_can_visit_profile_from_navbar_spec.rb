require 'rails_helper'

RSpec.describe "A signed-in user can visit their profile from the navbar" do
  it "can visit their profile from the navbar" do
    user = create(:user)

    visit root_path

    click_on 'SIGN IN'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    find('.btn-sign-in').click

    find('.user-avatar').click
    find('.my-account-link').click

    expect(current_path).to eq user_path(user)
    expect(page).to have_content("#{user.first_name}")
    expect(page).to have_content("#{user.last_name}")
  end
end

# 27. A logged in user can visit profile from navbar
# As a logged in user
# When I click on my avatar
# And then I click on My Account
# Then I will be redirected to a user dashboard
