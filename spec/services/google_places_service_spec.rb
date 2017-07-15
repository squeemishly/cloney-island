require 'rails_helper'

describe GooglePlacesService do
  context 'class methods' do
    context '.fetch_attractions_by_city' do
      it 'has specific keys' do
        VCR.use_cassette('google_places_service_fetch_attractions_by_city') do
          city = {name: "Paris", country:"France", description: "Has a metal tower", lat: 48.8566, lng: 2.3522}
          raw_attractions = GooglePlacesService.fetch_attractions_by_city(city)
          attraction = raw_attractions.first

          expect(raw_attractions).to be_an Array
          expect(attraction).to be_a Hash
          expect(attraction).to have_key(:name)
          expect(attraction).to have_key(:place_id)
          expect(attraction).to have_key(:geometry)
          expect(attraction[:geometry]).to have_key(:location)
          expect(attraction[:geometry][:location]).to have_key(:lat)
          expect(attraction[:geometry][:location]).to have_key(:lng)
          expect(attraction[:name]).to be_a String
          expect(attraction[:place_id]).to be_a String
          expect(attraction[:geometry]).to be_a Hash
          expect(attraction[:geometry][:location]).to be_a Hash
          expect(attraction[:geometry][:location][:lat]).to be_a Float
          expect(attraction[:geometry][:location][:lng]).to be_a Float

          expect(attraction[:vicinity]).to be_a String if attraction[:vicinity]
          expect(attraction[:photos][0][:photo_reference]).to be_a String if attraction[:photos]
        end
      end
    end
  end
end
