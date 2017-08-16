class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:private_chat_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
