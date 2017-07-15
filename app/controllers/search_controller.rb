class SearchController < ApplicationController
  def index
    if params[:city]
      @city = eval(params[:city])
      @attractions = Attraction.fetch_attractions_by_city(@city)
      @attractions_js = Attraction.marker_format(@attractions)

    elsif params[:attraction]
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{params[:attraction]}&key=#{ENV['google_map_api_key']}")
      @attraction = JSON.parse(response.body, symbolize_names: true)[:result]
    end
  end
end
