require 'rails_helper'

RSpec.describe "Admin" do

  it "sees their dashboard" do
    admin = create(:user, role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'
    click_on "Dashboard"
    expect(current_path).to eq("/admin/dashboard")

    expect(page).to have_selector('#query')
  end
end

# As an admin
# When I login,
# I am redirected to /admin/dashboard
# And I see user search field
# * Maybe add analytics later?
