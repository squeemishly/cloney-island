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
      city_place_info = {name: @city.name, lat: @city.lat, lng: @city.lng}
      redirect_to "/search?city=#{city_place_info}"
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
    redirect_to "/search?city=#{city_place_info}&trip=#{@trip.id}"
  end

  def update
    @trip = Trip.find(params[:id]) if current_user.trips.include?(Trip.find(params[:id]))
    @place = Place.find_or_create_by(google_place_id: params[:place_id]) do |place|
      place.name = params[:name]
      place.lat = params[:lat]
      place.lng = params[:lng]
    end
    @trip.itineraries.create(place_id: @place.id, date: @trip.start_date)
    flash.now[:notice] = "#{@place.name} successfully added"
    binding.pry
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :start_city)
  end
end
