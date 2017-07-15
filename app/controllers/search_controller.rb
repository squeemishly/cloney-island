class SearchController < ApplicationController
  def index
    if params[:city]
      @city = eval(params[:city])
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@city[:lat]},#{@city[:lng]}&radius=5000&types=point-of-interest&keyword=attraction&language=english&key=#{ENV['google_map_api_key']}")
      @attractions = JSON.parse(response.body, symbolize_names: true)[:results]
      @attractions_js = []
      @attractions.each do |at_hash|
        @attractions_js << [at_hash[:name].to_s, at_hash[:geometry][:location][:lat], at_hash[:geometry][:location][:lng]]
      end
      @attractions_js
    elsif params[:attraction]
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{params[:attraction]}&key=#{ENV['google_map_api_key']}")
      @attraction = JSON.parse(response.body, symbolize_names: true)[:result]
    end
  end
end
