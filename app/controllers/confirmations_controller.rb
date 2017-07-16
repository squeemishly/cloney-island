class ConfirmationsController < ApplicationController
  def new
     @user = current_user
  end

  def create
    @user = current_user
    if @user.verification_code == params[:verification_code]
      session[:authenticated] = true
      flash[:notice] = "Verification code is correct!"
      redirect_to user_trips_path(current_user.id)
    else
      flash.now[:error] = "Verification code is incorrect."
      render :new
    end
  end
end
