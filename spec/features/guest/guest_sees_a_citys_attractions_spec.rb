# require 'rails_helper'

# feature "guest navigates to city from root" do
#   context "they are not logged in" do
#     it "they see a list of attractions in the the city they clicked on" do
#       VCR.use_cassette("city_attractions") do
#         visit root_path

#         within ('.column-list') do
#           expect(page).to have_selector(".city-preview")
#           click_on "Paris, France"
#         end

#         within first(".attraction-preview") do
#           expect(page).to have_selector(".add-attraction-button")
#           expect(page).to have_selector(".attraction-image-container")
#           expect(page).to have_selector(".attraction-preview-name")
#         end
#       end
#     end
#   end
# end
