class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_trips_path(@user)
    else
      flash[:notice] = "The email or password you entered is incorrect"
      redirect_to login_path
    end
  end
end