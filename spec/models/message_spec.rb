require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "attributes" do
    it do
      is_expected.to respond_to :content
      is_expected.to respond_to :user_id
      is_expected.to respond_to :private_chat_id
    end
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:private_chat) }
  end
end
