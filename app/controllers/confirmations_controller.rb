class ConfirmationsController < ApplicationController
  def new
    @user = current_user || User.find(params[:user_id])
  end

  def create
    user = current_user || User.find(params[:user_id])

    if user.verification_code == params[:verification_code]
      session[:authenticated] = true
      flash[:notice] = "Verification code is correct!"
      session[:user_id] = user.id
      redirect_to users_password_edit_path(user.id)
    else
      flash[:error] = "Verification code is incorrect."
      redirect_to new_confirmation_path(user_id: user.id)
    end
  end

  def verify
    if User.exists?(email: params[:email])
      user = User.find_by(email: params[:email])
      ConfirmationSender.send_confirmation_to(user)
      redirect_to new_confirmation_path(user_id: user.id)
    else
      flash[:error] = "Email address cannot be found."
      redirect_to login_path
    end
  end
end
