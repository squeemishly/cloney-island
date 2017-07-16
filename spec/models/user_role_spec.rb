require 'rails_helper'

RSpec.describe UserRole do

  #######################
  # We don't need this one any more
  #######################

  context "attributes" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:role_id) }
  end

  context "relationships" do
    it "has relationships" do
      ur = create(:user_role)
      expect(ur).to respond_to :roles
      expect(ur).to respond_to :users
    end
  end
end
