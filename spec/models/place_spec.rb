require 'rails_helper'

RSpec.describe Attraction do

      #######################
      # We don't need this one any more
      # We have the attraction test instead
      #######################


  context "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:website) }
    it { should validate_presence_of(:wiki_link) }
    it { should validate_presence_of(:facebook) }
    it { should validate_presence_of(:admission) }
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:city_id) }
  end

  context "relationships" do
    it "has relationships" do
      place = create(:attraction)
      expect(place).to respond_to :itineraries
      expect(place).to respond_to :cities
    end
  end
end
