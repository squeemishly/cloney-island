class ChatQueryController < ApplicationController
  def index
    if @user = User.find_by(username: params[:chat_query])
      @user
    else
      flash[:notice] = "The username you entered does not exist"
      redirect_to conversations_path
    end
  end
end