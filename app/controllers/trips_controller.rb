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
      redirect_to "/search?city=#{@city.id}&trip=#{@trip.id}"
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
    redirect_to "/search?city=#{@trip.city.id}&trip=#{@trip.id}"
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip && @trip.user == current_user
      if params[:place_id]
        @place = Place.find_or_create_by(google_place_id: params[:place_id]) do |place|
          place.name = params[:name]
          place.lat = params[:lat]
          place.lng = params[:lng]
        end

        itinerary = @trip.itineraries.new(place_id: @place.id, date: Date.parse(params[:day]))
        if itinerary.save
          message = "#{@place.name} successfully added to #{params[:day]}"
          response_status = 201
        else
          message = "Your itinerary didn't save. Error: #{itinerary.errors}"
          response_status = 500
        end
      else
        message = "Place Id is missing."
        response_status = 404
      end
    elsif @trip
      message = "You can't add attractions to other's trips!"
      response_status = 403
    else
      message = "Something went wrong, please try again!"
      response_status = 418
    end

    render plain: message, status: response_status
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :start_city)
  end
end
