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
      query = params[:query]
      response = Faraday.new("https://maps.googleapis.com/maps/api/place/textsearch/json?key=#{ENV['google_map_api_key']}&query=#{query}")
      binding.pry
      info = JSON.parse(response.body, symbolize_names: true)[:results][0]
      @city = City.find_or_create_by(place_id: raw_city[:place_id]) do |city|
        city.name = raw_city[:name]
        city.country = raw_city[:formatted_address].split(", ").last
        city.picture = photo_lookup(raw_city[:photos].first[:photo_reference])
        city.lat = raw_city[:geometry][:location][:lat]
        city.lng = raw_city[:geometry][:location][:lng]
      end

      @attraction_type = "point-of-interest"
      @attractions = Attraction.fetch_attractions_by_city(@attraction_type, @city)
      @attractions_js = Attraction.marker_format(@attractions)
    end
  end
end
