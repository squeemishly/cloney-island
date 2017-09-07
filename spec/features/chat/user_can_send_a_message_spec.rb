require 'rails_helper'

RSpec.describe "A user sends a message" do
  xit "can chat with another user" do
    user = create(:user)
    user2 = create(:user)
    chat = PrivateChat.create(participant_ids: ["#{user.id}", "#{user2.id}"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit private_chat_path(chat)
    fill_in "message[content]", with: "Hello World!"
    click_on "Send"

    expect(current_path).to eq(private_chat_path(chat))
    expect(page).to have_content("This is the beginning of your private conversation with #{user2.username}")
    expect(page).to have_content("Hello World!")
  end
end
