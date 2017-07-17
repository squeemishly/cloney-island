# require 'rails_helper'

# RSpec.describe "Admin" do
#   before :each do
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#     admin = create(:user)
#     role = create(:role, name: "admin")
#     admin.roles << role
#   end

#   it "sees their dashboard" do
#     expect(current_path).to eq("/admin/#{admin.id}/dashboard")

#     expect(page).to have_selector('.search')
#   end
# end

# # As an admin
# # When I login, 
# # I am redirected to /admin/dashboard
# # And I see user search field
# # * Maybe add analytics later?
