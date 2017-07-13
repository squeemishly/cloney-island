class SearchController < ApplicationController
  def index
    # @cities = [{name: "London", country:"England", description: "Has a clock", lat: 51.5074, lng: 0.1278},
    #           {name: "Paris", country:"France", description: "Has a metal tower", lat: 48.8566, lng: 2.3522},
    #           {name: "Denver", country: "United States", description: "Has a scary horse", lat: 39.7392, lng: -104.9903}]
    @city = eval(params[:city])
    # @city = {name: "Paris", country:"France", description: "Has a metal tower", lat: 48.8566, lng: 2.3522}
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@city[:lat]},#{@city[:lng]}&radius=5000&types=point-of-interest&keyword=tourist&language=english&key=#{ENV['google_places_api_key']}")
    @attractions = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
