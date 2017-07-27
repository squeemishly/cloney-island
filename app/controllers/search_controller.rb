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
    elsif params[:query]
      @city = City.city_find(params[:query])

      # query = params[:query]
      # response = Faraday.get("https://maps.googleapis.com/maps/api/place/textsearch/json?key=#{ENV['google_map_api_key']}&query=#{query}")
      # info = JSON.parse(response.body, symbolize_names: true)[:results][0]
      # @city = City.city_search(info)

      @attraction_type = "point-of-interest"
      @attractions = Attraction.fetch_attractions_by_city(@attraction_type, @city)
      @attractions_js = Attraction.marker_format(@attractions)
    end
  end
end
