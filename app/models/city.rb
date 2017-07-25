class City < ApplicationRecord
  has_many :trips

  def self.create_new_city(params)
    raw_city = city_lookup(params)
    city_search(raw_city)
  end

  def self.city_lookup(params)
    GooglePlacesService.fetch_city(params)
  end

  def self.photo_lookup(reference)
    GooglePlacesService.new.fetch_photo(reference)
  end

  def self.city_search(params)
    City.find_or_create_by(place_id: params[:place_id]) do |city|
      city.name = params[:name]
      city.country = params[:formatted_address].split(", ").last
      city.picture = photo_lookup(params[:photos].first[:photo_reference])
      city.lat = params[:geometry][:location][:lat]
      city.lng = params[:geometry][:location][:lng]
    end
  end

end
