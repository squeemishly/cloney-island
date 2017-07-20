require 'rails_helper'

feature "guest visits root" do
  before(:each) do
    city = create(:city)
    city = create(:city, name: "London")
  end
  context "they are not logged in" do
    it "they see main page elements" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette("main_page_elements") do
        visit root_path

        within (".column-list") do
          first("a").click
        end

        within('.navbar-collapse.navbar-filters') do
          expect(page).to have_content('Sightseeing')
          expect(page).to have_content('Shopping')
          expect(page).to have_content('Restaurants')
          expect(page).to have_content('Museums')
          expect(page).to have_content('Libraries')
          expect(page).to have_content('Transport')
          expect(page).to have_content('Nightlife')
          expect(page).to have_content('Parks')
          expect(page).to have_content('Sports')
          expect(page).to have_content('Relaxation')
        end

        expect(page).to have_selector(".main-map")
        expect(page).to have_selector(".column-list")
      end
    end
  end
end
