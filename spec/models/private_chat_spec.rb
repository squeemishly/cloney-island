require 'rails_helper'

RSpec.describe PrivateChat, type: :model do
  describe "attributes" do
    it do
      is_expected.to respond_to :participant_ids
    end
  end

  describe "relationships" do
    it { should have_many(:messages) }
  end
end
