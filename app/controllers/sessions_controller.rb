class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      cookies[:user_id] = @user.id
      if @user.vendor?
        redirect_to user_vendor_dashboard_path(@user)
      elsif @user.trips == []
        redirect_to new_user_trip_path(@user)
      else
        redirect_to user_trips_path(@user)
      end
    else
      flash[:notice] = "The email or password you entered is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
