require 'rails_helper'

RSpec.describe City do
  context "attributes" do
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    it "responds to trips and places" do
      city = create(:city)
      expect(city).to respond_to :trips
      expect(city).to respond_to :places
    end
  end
end
