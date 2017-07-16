class Users::PasswordsController < ApplicationController
  def reset
    ConfirmationSender.send_confirmation_to(current_user)
    redirect_to new_confirmation_path
  end
end
