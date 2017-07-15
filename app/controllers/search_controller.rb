class SearchController < ApplicationController
  def index
    if params[:city]
      @city = eval(params[:city])
      @attractions = Attraction.fetch_attractions_by_city(@city)
      @attractions_js = Attraction.marker_format(@attractions)

    elsif params[:attraction]
      @attraction = Attraction.fetch_details(params[:attraction])
    end
  end
end
