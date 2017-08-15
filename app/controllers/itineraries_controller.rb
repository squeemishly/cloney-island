class ItinerariesController < ApplicationController
  def destroy
    current_user.trips.find(params[:trip_id]).itineraries.find(params[:id]).destroy
    redirect_to user_trip_path(current_user, params[:trip_id])
  end
end
