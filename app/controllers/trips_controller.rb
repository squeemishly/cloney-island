class TripsController < ApplicationController
  def new
    @user = current_user
    @trip = Trip.new
  end

  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @trip = Trip.new(trip_params)
    @user.trips << @trip
    if @trip.save
      redirect_to '/'
    else
      @trip = Trip.new
      redirect_to new_user_trip_path(@user)
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :start_city)
  end
end
