require 'rails_helper'

RSpec.describe "A signed-in user can view their account options in My Account" do
  it "can view their account options" do
    user = create(:user)

    visit root_path

    click_on 'Sign In'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    find(".btn-sign-in").click
    click_on "My Account"
    
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Edit Email")
    expect(page).to have_content("Edit Phone")
    expect(page).to have_content("Change Password")
    expect(page).to have_content("View My Reviews")
    expect(page).to have_content("Delete Account")
  end
end
