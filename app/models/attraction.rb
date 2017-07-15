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

  private
    attr_reader :attr
end
