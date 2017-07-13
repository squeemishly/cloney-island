class WelcomeController < ApplicationController
  def index
    @cities = [{name: "London", country:"England", description: "Has a clock", coordinates:{lat: 51.5074, lng: 0.1278}},
              {name: "Paris", country:"France", description: "Has a metal tower", coordinates:{lat: 48.8566, lng: 2.3522}},
              {name: "Denver", country: "United States", description: "Has a scary horse", coordinates:{lat: 39.7392, lng: -104.9903}}]
  end
end
