require 'rails_helper'

RSpec.describe Review do
  context "attributes" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:tour_id) }
    it { should validate_presence_of(:user_id) }
  end

  context "relationships" do
    review = create(:review)
    expect(review).to respond_to :users
    expect(review).to respond_to :tours
  end
end
