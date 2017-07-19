class TripsController < ApplicationController
  def new
    @user = current_user
    @trip = Trip.new
  end

  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def create
    @city = City.create_new_city(params)
    @trip = Trip.new(trip_params)
    current_user.trips << @trip
    @city.trips << @trip
    if @trip.save
      redirect_to "/search?city=#{@city.id}"
    else
      @trip = Trip.new
      redirect_to new_user_trip_path(current_user)
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    city_place_info = {name: @trip.city.name,lat: @trip.city.lat, lng: @trip.city.lng}
    redirect_to "/search?city=#{city_place_info}"
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :start_city)
  end
end
