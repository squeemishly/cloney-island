class Attraction
  attr_reader :name,
              :vicinity,
              :place_id,
              :photo_url,
              :lat,
              :lng,
              :formatted_address,
              :formatted_phone_number,
              :rating,
              :website,
              :opening_hours,
              :international_phone_number,
              :reviews

  def initialize(attr={})
    @attr = attr
    @name = attr[:name]
    @vicinity = attr[:vicinity]
    @place_id = attr[:place_id]
    @lat = attr[:geometry][:location][:lat]
    @lng = attr[:geometry][:location][:lng]
    if attr[:photos]
      @photo_url = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{attr[:photos][0][:photo_reference]}&sensor=false&maxheight=300&maxwidth=300&key=#{ENV['google_map_api_key']}"
    else
      @photo_url = "http://www.slepamapask.eu/img/slepa_mapa.png"
    end
    @formatted_address = attr[:formatted_address] if attr[:formatted_address]
    @formatted_phone_number = attr[:formatted_phone_number] if attr[:formatted_phone_number]
    @rating = attr[:rating] if attr[:rating]
    @website = attr[:website] if attr[:website]
    @opening_hours = attr[:opening_hours][:weekday_text] if attr[:opening_hours]
    @international_phone_number = attr[:international_phone_number] if attr[:international_phone_number]
    @reviews = attr[:reviews] if attr[:reviews]
  end

  def self.fetch_attractions_by_city(city)
    attractions = GooglePlacesService.fetch_attractions_by_city(city)
    attractions.map do |attraction|
      new(attraction)
    end
  end

  def self.marker_format(attractions)
    attractions.map do |attraction|
      [attraction.name, attraction.lat, attraction.lng, attraction.photo_url]
    end
  end

  def self.fetch_details(place_id)
    new(GooglePlacesService.fetch_details(place_id))
  end

  private
    attr_reader :attr
end
