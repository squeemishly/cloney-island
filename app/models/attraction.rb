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
    GooglePlacesService.fetch_attractions_by_city(city)
  end

  private
    attr_reader :attr
end
