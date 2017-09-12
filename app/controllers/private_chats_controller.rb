class PrivateChatsController < ApplicationController
  def index
    @chat_ids = PrivateChat.find_my_chats(current_user.id).pluck(:id)
    @private_chats = @chat_ids.map { |id| PrivateChat.find(id) }
  end

  def new
    @private_chat = PrivateChat.new
  end

  def create
    @participant_ids = params[:participant_ids].select(&:present?) << current_user.id.to_s
    @sorted_participant_ids = @participant_ids.map {|v| v.to_i }.uniq.sort
    if PrivateChat.find_existing(@sorted_participant_ids.join(",")).pluck(:id) != []
      existing_chat_id = PrivateChat.find_existing(@sorted_participant_ids.join(",")).pluck(:id)[0]
      @private_chat = PrivateChat.find(existing_chat_id)
    else
      @private_chat = PrivateChat.create(participant_ids: @sorted_participant_ids)
    end
    redirect_to private_chat_path(@private_chat)
  end

  def show
    @private_chat = PrivateChat.find(params[:id])
    @participants = @private_chat.participant_ids.map { |id| User.find(id.to_i).username }
  end
end