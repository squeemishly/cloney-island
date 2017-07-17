require 'rails_helper'

RSpec.describe User do
  context "attributes" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:status) }
  end

  context "relationships" do
    it "has relationships" do
      user = create(:user)
      expect(user).to respond_to :tours
      expect(user).to respond_to :reviews
      expect(user).to respond_to :trips
    end
  end
end
