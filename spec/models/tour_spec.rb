require 'rails_helper'

RSpec.describe Tour, type: :model do
  context "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:user_id) }
  end

  context "relationships" do
    it "has relationships" do
      tour = create(:tour)
      # expect(tour).to respond_to :reviews
      expect(tour).to respond_to :users
    end
  end
end
