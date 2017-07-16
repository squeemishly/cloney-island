class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_trip_path(@user)
    else
      flash[:notice] = "User creation failed. Please try again"
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :status, :role, :password_confirmation)
    end
end