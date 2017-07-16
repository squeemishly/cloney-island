require 'rails_helper'

RSpec.describe "A signed-in user can view their account options in My Account" do
  it "can view their account options" do
    user = create(:user)

    visit root_path

    click_on 'SIGN IN'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    find(".btn-sign-in").click
    # select('My Account', :from => 'Select Box')

    expect(current_path).to eq("/users/#{user.id}/trips")
    expect(page).to have_content("Edit Email")
    expect(page).to have_content("Edit Phone")
    expect(page).to have_content("Update Image")
    expect(page).to have_content("Change Password")
    expect(page).to have_content("View My Reviews")
    expect(page).to have_content("Delete Account")
  end
end

# 28. A logged in user can see account options in My Account
# **Assuming not using oauth**
# As a logged in user
# When I visit my Account
# Then I will see...
# -edit email
# -edit phone
# -update image
# -change password
# -View my reviews
# -delete account
# *revisit for oauth parameters
