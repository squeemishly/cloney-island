class GooglePlacesService
  attr_reader :city,
              :place_id,
              :start_city,
              :conn

  def initialize(args = {})
    @city = args[:city]
    @place_id = args[:place_id]
    @start_city = args[:start_city]
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/place/")
  end

  def fetch_attractions_by_city(attraction_type)
    get_url("nearbysearch/json?location=#{city[:lat]},#{city[:lng]}&radius=5000&types=#{attraction_type}&keyword=attractions&language=english&key=#{ENV['google_map_api_key']}")[:results]
  end

  def fetch_details
    get_url("details/json?placeid=#{place_id}&key=#{ENV['google_map_api_key']}")[:result]
  end

  def get_url(url)
    result = conn.get(url)
    json_parse(result)
  end

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_attractions_by_city(attraction_type, city)
    new({city: city}).fetch_attractions_by_city(attraction_type)
  end

  def self.fetch_details(place_id)
    new({place_id: place_id}).fetch_details
  end

  def fetch_city
    get_url("textsearch/json?key=#{ENV['google_map_api_key']}&query=#{start_city}")[:results][0]
  end

  def fetch_photo(reference)
    response = conn.get("photo?key=#{ENV['google_map_api_key']}&photoreference=#{reference}&maxwidth=700")
    response.body.split("=\"").last.split("\"").first
  end

  def self.fetch_city(params)
    new({start_city: params[:trip][:start_city]}).fetch_city
  end

  def self.search_for_city(query)
    new.search_for_city(query)
  end

  def search_for_city(query)
    get_url("textsearch/json?key=#{ENV['google_map_api_key']}&query=#{query}")[:results][0]
  end
end
