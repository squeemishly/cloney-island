require 'rails_helper'

RSpec.describe Role do

    #######################
    # We don't need this one any more
    #######################


  context "attributes" do
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    it "has relationships" do
      role = create(:role)
      expect(role).to respond_to :user_roles
    end
  end
end
