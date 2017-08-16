class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
    redirect_to private_chat_path(params[:message][:private_chat_id])
  end

  private
    def message_params
      params.require(:message).permit(:content, :private_chat_id)
    end
end