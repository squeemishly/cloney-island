class City < ApplicationRecord
  has_many :trips

  def self.create_new_city(params)
    raw_city = city_lookup(params)
    City.find_or_create_by(place_id: raw_city[:place_id]) do |city|
      city.name = raw_city[:name]
      city.country = raw_city[:formatted_address].split(", ").last
      city.picture = photo_lookup(raw_city[:photos].first[:photo_reference])
      city.lat = raw_city[:geometry][:location][:lat]
      city.lng = raw_city[:geometry][:location][:lng]
    end
  end

  def self.city_lookup(params)
    GooglePlacesService.fetch_city(params)
  end

  def self.photo_lookup(reference)
    GooglePlacesService.new.fetch_photo(reference)
  end

end
