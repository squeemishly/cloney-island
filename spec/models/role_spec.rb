require 'rails_helper'

RSpec.describe Role do
  context "attributes" do
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    role = create(:role)
    expect(role).to respond_to :user_roles
  end
end
