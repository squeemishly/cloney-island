require 'rails_helper'

RSpec.describe "User sees all open conversations" do
  it "user1 sees a list of participants usernames indicating open conversations" do
    user = create(:user)
    user2 = create(:user)
    chat = PrivateChat.create(participant_ids: ["#{user.id}", "#{user2.id}"])
    message = Message.create(content: "hi", user_id: user.id, private_chat_id: chat.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Chat"

    expect(current_path).to eq(private_chats_path)
    expect(page).to have_content("#{user2.username}")

    click_on "#{user2.username}"
    expect(current_path).to eq(private_chat_path(chat.id))
  end

  it "user2 sees a list of participants usernames indicating open conversations" do
    user = create(:user)
    user2 = create(:user)
    chat = PrivateChat.create(participant_ids: ["#{user.id}", "#{user2.id}"])
    message = Message.create(content: "hi", user_id: user.id, private_chat_id: chat.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit "/"
    click_on "Chat"

    expect(current_path).to eq(private_chats_path)
    expect(page).to have_content("#{user.username}")

    click_on "#{user.username}"
    expect(current_path).to eq(private_chat_path(chat.id))
  end
end
