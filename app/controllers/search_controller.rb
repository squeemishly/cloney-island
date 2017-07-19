class SearchController < ApplicationController
  def index
    if params[:city]
      @city_id = params[:city]
      @city = City.find(@city_id)
      if params[:trip]
        @trip = Trip.find(params[:trip])
      end

      @attraction_type = params[:attraction_type] || "point-of-interest"

      @attractions = Attraction.fetch_attractions_by_city(@attraction_type, @city)
      @attractions_js = Attraction.marker_format(@attractions)

    elsif params[:attraction]
      @attraction = Attraction.fetch_details(params[:attraction])
    end
  end
end
