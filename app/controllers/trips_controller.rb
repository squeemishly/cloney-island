class TripsController < ApplicationController
  def new
    @user = current_user
    @trip = Trip.new
  end

  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def create
    # response = Faraday.get("https://maps.googleapis.com/maps/api/place/textsearch/json?key=AIzaSyDsH3cXjVtbV0tw7CcDAbDQQEt39K7MCyA&query=#{params[:trip][:start_city]}")
    # raw_city_info = JSON.parse(response.body, symbolize_names: true)[:results][0]
    # @city = City.create_new_city(raw_city_info)
    @city = City.create_new_city(params)
    @user = User.find(params[:user_id])
    @trip = Trip.new(trip_params)
    @user.trips << @trip
    @city.trips << @trip
    if @trip.save
      city_place_info = {name: @city.name, lat: @city.lat, lng: @city.lng}
      redirect_to "/search?city=#{city_place_info}"
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
