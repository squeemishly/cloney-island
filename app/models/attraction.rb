class Attraction
  attr_reader :name,
              :vicinity,
              :place_id,
              :photo_reference,
              :lat,
              :lng

  def initialize(attr={})
    @attr = attr
    @name = attr[:name]
    @vicinity = attr[:vicinity]
    @place_id = attr[:place_id]
    @photo_reference = attr[:photos][0][:photo_reference] if attr[:photos]
    @lat = attr[:geometry][:location][:lat]
    @lng = attr[:geometry][:location][:lng]
  end

  def self.fetch_attractions_by_city(city)
    attractions = GooglePlacesService.fetch_attractions_by_city(city)
    attractions.map do |attraction|
      new(attraction)
    end
  end

  def self.marker_format(attractions)
    attractions.map do |attraction|
      [attraction.name, attraction.lat, attraction.lng]
    end
  end

  def self.fetch_details(place_id)
    # GooglePlacesService.fetch_details(place_id)
    
  end

  private
    attr_reader :attr
end
