require 'rails_helper'

RSpec.describe "A user can view the tour index page" do
  it "can view a list of tours on the tour index page" do
     user = create(:user)
     tour1 = create(:tour)

     visit root_path

     click_on 'Sign In Using Email'
     fill_in 'Email', with: "#{user.email}"
     fill_in 'Password', with: 'password'
     click_on "Sign in"
     click_on "Tours"

     expect(current_path).to eq(tours_path)

     click_on "#{tour1.name}"

     expect(current_path).to eq("/tours/#{tour1.id}")
     expect(page).to have_content(tour1.name)
     expect(page).to have_content(tour1.price)
     expect(page).to have_content(tour1.description)
     expect(page).to have_content(tour1.avg_rating)
     expect(page).to have_content("Leave A Review")
     expect(page).to have_content("Reviews For #{tour1.name}")
   end
 end
