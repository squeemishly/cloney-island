require 'rails_helper'

RSpec.describe Itinerary do
  context "attributes" do
    it { should validate_presence_of(:trip_id) }
    it { should validate_presence_of(:place_id) }
    it { should validate_presence_of(:date) }
  end

  context "relationships" do
    it "has relationships" do
      itinerary = create(:itinerary)
      expect(itinerary).to respond_to :trips
      expect(itinerary).to respond_to :places
    end
  end
end
