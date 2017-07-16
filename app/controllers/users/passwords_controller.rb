class Users::PasswordsController < ApplicationController
  before_action :authenticated?, only: [:edit, :update]

  def reset
    ConfirmationSender.send_confirmation_to(current_user)
    redirect_to new_confirmation_path
  end

  def edit
    @user = current_user
  end

  private

    def authenticated?
      render file: "#{Rails.root}/public/404.html", status: 404 unless session[:authenticated]
    end
end
