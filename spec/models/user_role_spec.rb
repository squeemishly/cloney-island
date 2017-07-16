require 'rails_helper'

RSpec.describe UserRole do
  context "attributes" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:role_id) }
  end

  context "relationships" do
    ur = create(:user_role)
    expect(ur).to respond_to :roles
    expect(ur).to respond_to :users
  end
end
