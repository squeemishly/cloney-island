require 'rails_helper'

RSpec.describe "A signed-in user can delete their account" do
  it "can delete their account" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    find('.user-avatar').click
    find('.my-account-link').click
    expect(page).to have_content("Account Information")
    click_on "Delete Account"
    expect(current_path).to eq("/")
  end
end

# 25. A registered user can delete their account
# As a logged in user
# When I click on the avatar in the upper right hand corner
# And I click on My Account
# And I click on Delete Account
# And I click on OK
# Then my account will be deleted from the website
# And I will be redirected to ‘/’
# And if I try to sign in again, I’ll get a  'invalid account information, try again' message
