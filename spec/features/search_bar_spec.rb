require 'rails_helper'

RSpec.describe "a user can search for a city" do
  it "when they type a city name into the search bar" do
    VCR.use_cassette("user_can_search_for_a_city") do
      visit '/'

      fill_in :query, with: "Beijing"
      click_on "Search"

      expect(page).to have_content "Beijing"
      expect(current_path).to eq '/search'
    end
  end
end
