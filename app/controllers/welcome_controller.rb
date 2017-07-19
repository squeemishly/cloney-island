class WelcomeController < ApplicationController
  def index
    @cities = [{name: "Denver", country: "United States", lat: 39.7392, lng: -104.9903, picture: "https://res.cloudinary.com/simpleview/image/upload/c_fill,f_auto,h_645,q_50,w_1024/v1/clients/denver/denver_skyline_sunrise_74e8feaa_b49a_4b25_9720_c835907530a9_ca5bc80d-6503-4f77-8220-5520ee2bdac2.jpg"},
              {name: "London", country:"United Kingdom", lat: 51.5074, lng: 0.1278, picture: "https://media.timeout.com/images/103042848/image.jpg"},
              {name: "Paris", country:"France", lat: 48.8566, lng: 2.3522, picture: "http://www.parisaddress.com/var/source/district/new/tour_eiffel-paris.jpg"}]
  end
end
