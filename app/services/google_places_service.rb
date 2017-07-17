class GooglePlacesService
  attr_reader :city,
              :place_id,
              :conn,
              :place_type

  def initialize(args = {})
    @city = args[:city]
    @place_id = args[:place_id]
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/place/")
    @place_type = "point-of-interest"
  end

  def fetch_attractions_by_city
    get_url("nearbysearch/json?location=#{city[:lat]},#{city[:lng]}&radius=5000&types=#{place_type}&keyword=attractions&language=english&key=#{ENV['google_map_api_key']}")[:results]
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

  def self.fetch_attractions_by_city(city)
    new({city: city}).fetch_attractions_by_city
  end

  def self.fetch_details(place_id)
    new({place_id: place_id}).fetch_details
  end
end
