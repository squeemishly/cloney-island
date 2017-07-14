class SearchController < ApplicationController
  def index
    if params[:city]
      @city = eval(params[:city])
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@city[:lat]},#{@city[:lng]}&radius=5000&types=point-of-interest&keyword=tourist&language=english&key=#{ENV['google_map_api_key']}")
      @attractions = JSON.parse(response.body, symbolize_names: true)[:results]
    elsif params[:attraction]
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{params[:attraction]}&key=#{ENV['google_map_api_key']}")
      @attraction = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
