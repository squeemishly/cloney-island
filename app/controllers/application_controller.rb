class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def authenticated?
  #   session[:user_id] && session[:authenticated]
  # end
  #
  # def authenticate!
  #   redirect_to new_session_path and return unless authenticated?
  # end
  #
  # helper_method :authenticated?
end
