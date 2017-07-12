require 'rails_helper'

RSpec.describe "A signed-in user can edit their tour reviews" do
  it "can edit a tour review" do
    user = create(:user)
    tour1 = create(:tour)
    review1 = create(:review)
    review2 = create(:review)

    visit root_path

    click_on 'Sign In Using Email'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: 'password'
    click_on "Sign in"
    select('My Account', :from => 'Select Box')

    expect(page).to have_content("Account Information")

    click_on "View My Reviews"

    expect(current_path).to eq("/users/#{user.id}/reviews")
    expect(page).to have_content(review1.name)

    click_on "Edit"

    fill_in 'Title', with: "#{review2.title}"
    fill_in 'Description', with: "#{review2.description}"
    click_on "Save"

    expect(current_path).to eq("/users/#{user.id}/reviews")
  end
end
