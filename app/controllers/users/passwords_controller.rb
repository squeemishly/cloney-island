class Users::PasswordsController < ApplicationController
  before_action :authenticated?, only: [:edit, :update]

  def reset
    ConfirmationSender.send_confirmation_to(current_user)
    redirect_to new_confirmation_path
  end

  def edit
    @user = current_user
  end

  def update
    if passwords_not_empty? && passwords_equal?
      current_user.update(password_params)
      redirect_to user_trips_path(current_user.id), success: "Password Updated"
      sessions[:authenticated] = false
    else
      redirect_to users_password_edit_path(current_user.id), warning: "Error, please try again."
    end
  end

  private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def passwords_not_empty?
      params[:user][:password].length > 0 && params[:user][:password_confirmation].length > 0
    end

    def passwords_equal?
      params[:user][:password] == params[:user][:password_confirmation]
    end

    def authenticated?
      render file: "#{Rails.root}/public/404.html", status: 404 unless session[:authenticated]
    end
end
