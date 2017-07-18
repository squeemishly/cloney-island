class City < ApplicationRecord
  has_many :trips

  def self.create_new_city(args)
    name = args[:name]
    lat = args[:geometry][:location][:lat]
    lng = args[:geometry][:location][:lng]
    place_id = args[:place_id]
    City.create(name: name, lat: lat, lng: lng, place_id: place_id)
  end

end
