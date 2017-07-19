require 'rails_helper'

describe GooglePlacesService do
  context 'class methods' do
    context '.fetch_attractions_by_city' do
      it 'has specific keys' do
        VCR.use_cassette('google_places_service_fetch_attractions_by_city') do
          city = {name: "Paris", country:"France", description: "Has a metal tower", lat: 48.8566, lng: 2.3522}
          raw_attractions = GooglePlacesService.fetch_attractions_by_city(attraction_type = 'library', city)
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

    context '.fetch_details' do
      it 'has specific keys' do
        VCR.use_cassette('google_places_service_fetch_details') do
          place_id = "ChIJATr1n-Fx5kcRjQb6q6cdQDY"
          raw_attraction = GooglePlacesService.fetch_details(place_id)

          expect(raw_attraction).to be_a Hash
          expect(raw_attraction).to have_key(:name)
          expect(raw_attraction).to have_key(:geometry)
          expect(raw_attraction[:geometry]).to have_key(:location)
          expect(raw_attraction[:geometry][:location]).to have_key(:lat)
          expect(raw_attraction[:geometry][:location]).to have_key(:lng)


          expect(raw_attraction[:name]).to be_a String
          expect(raw_attraction[:geometry]).to be_a Hash
          expect(raw_attraction[:geometry][:location]).to be_a Hash
          expect(raw_attraction[:geometry][:location][:lat]).to be_a Float
          expect(raw_attraction[:geometry][:location][:lng]).to be_a Float

          if raw_attraction[:rating]
            expect(raw_attraction).to have_key(:rating)
            expect(raw_attraction[:rating]).to be_a Float
          end

          if raw_attraction[:website]
            expect(raw_attraction).to have_key(:website)
            expect(raw_attraction[:website]).to be_a String
          end

          if raw_attraction[:formatted_phone_number]
            expect(raw_attraction).to have_key(:formatted_phone_number)
            expect(raw_attraction[:formatted_phone_number]).to be_a String
          end

          if raw_attraction[:formatted_address]
            expect(raw_attraction).to have_key(:formatted_address)
            expect(raw_attraction[:formatted_address]).to be_a String
          end

          if raw_attraction[:opening_hours]
            expect(raw_attraction).to have_key(:opening_hours)
            expect(raw_attraction[:opening_hours]).to have_key(:weekday_text)
            expect(raw_attraction[:opening_hours]).to be_a Hash
            expect(raw_attraction[:opening_hours][:weekday_text]).to be_a String
          end

          if raw_attraction[:international_phone_number]
            expect(raw_attraction).to have_key(:international_phone_number)
            expect(raw_attraction[:international_phone_number]).to be_a String
          end

          if raw_attraction[:reviews]
            expect(raw_attraction).to have_key(:reviews)
            expect(raw_attraction[:reviews].first).to have_key(:author_name)
            expect(raw_attraction[:reviews].first).to have_key(:rating)
            expect(raw_attraction[:reviews].first).to have_key(:relative_time_description)
            expect(raw_attraction[:reviews].first).to have_key(:text)
            expect(raw_attraction[:reviews].first).to have_key(:author_url)
            expect(raw_attraction[:reviews].first).to have_key(:profile_photo_url)
            expect(raw_attraction[:reviews].first).to be_a Hash
            expect(raw_attraction[:reviews].first[:author_name]).to be_a String
            expect(raw_attraction[:reviews].first[:rating]).to be_a Integer
            expect(raw_attraction[:reviews].first[:relative_time_description]).to be_a String
            expect(raw_attraction[:reviews].first[:text]).to be_a String
            expect(raw_attraction[:reviews].first[:author_url]).to be_a String
            expect(raw_attraction[:reviews].first[:profile_photo_url]).to be_a String
          end
        end
      end
    end
  end
end
