require 'rails_helper'

RSpec.describe Trip do
  context "attributes" do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:start_city) }
  end

  context "relationships" do
    it "has relationships" do
      trip = create(:trip)
      expect(trip).to respond_to :user
      expect(trip).to respond_to :itineraries
      expect(trip).to respond_to :cities
    end
  end
end
