require 'rails_helper'

RSpec.describe "a user starts a private chat" do
  it "can chat with another user" do
    user = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on "Chat"
    click_on "Start a new chat"
    select "#{user2.username}", from: "participant_ids[]"
    click_on "Go"

    expect(page).to have_content("This is the beginning of your private conversation with #{user2.username}")
  end
end