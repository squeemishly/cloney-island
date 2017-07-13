require 'rails_helper'

RSpec.describe "A signed-in user can delete their tour reviews" do
  it "can delete a tour review" do
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

    click_on "Delete"
    expect(page).to have_content("Are you sure you want to delete this review?")

    click_on "Yes"

    expect(current_path).to eq("/users/#{user.id}/reviews")
    expect(page).to_not have_content(review1.name)
  end
end

# 35. A user can delete their own reviews
# As a logged in user
# When I visit ‘my account’
# And I click on “View my reviews”
# And I click on delete
# Then I see a flash message: “Are you sure you want to delete it?”
# And I click “yes”
# Then it redirects me to “View my reviews” page
# And I do not see the review I deleted
