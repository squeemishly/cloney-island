class ConfirmationsController < ApplicationController
  def new
    if params[:email]
      @user = User.find_by(email: params[:email])
    else
      @user = current_user
    end
  end

  def create
    @user = current_user
    binding.pry
    if @user.verification_code == params[:verification_code]
      session[:authenticated] = true
      flash[:notice] = "Verification code is correct!"
      redirect_to users_password_edit_path(current_user.id)
    else
      flash.now[:error] = "Verification code is incorrect."
      render :new
    end
  end

  def show
  end
end
