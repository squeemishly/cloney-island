require 'rails_helper'

RSpec.describe "A signed-in user" do
  it "can sign out" do
    user = create(:user)

    visit root_path

    click_on 'SIGN IN'
    # find('.sign-in-link').click
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    find('.btn-sign-in').click

    find('.user-avatar').click
    find('.sign-out-link').click
    # .select('Sign Out')

    expect(current_path).to eq('/')
    expect(page).to have_content('SIGN IN')
    expect(page).to_not have_selector('.user-avatar')
  end
end

# A logged in user can log out
# As a logged in user
# When I click on my avatar
# And then I click on Sign Out
# I will be redirected to the root page
# I won't see my avatar
# I'll see the Sign In link in the primary navbar