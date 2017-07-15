class GooglePlacesService
  attr_reader :city,
              :conn

  def initialize(city)
    @city = city
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/place/")
  end

  def fetch_attractions_by_city
    get_url("nearbysearch/json?location=#{city[:lat]},#{city[:lng]}&radius=5000&types=point-of-interest&keyword=attraction&language=english&key=#{ENV['google_map_api_key']}")
  end

  def get_url(url)
    response = conn.get(url)
    json_parse(response)
  end

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.fetch_attractions_by_city(city)
    new(city).fetch_attractions_by_city
  end
end
