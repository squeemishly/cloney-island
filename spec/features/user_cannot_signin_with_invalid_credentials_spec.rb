require 'rails_helper'

RSpec.describe "A guest user cannot sign in with invalid credentials" do
  it "cannot sign in with invalid credentials" do

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: 'invalid@email.com'
    fill_in 'Password', with: 'wrongword'
    click_on "Sign in"

    expect(current_path).to eq('/')
    expect(current_page).to have_content("Invalid account information, please try again.")
  end
end
