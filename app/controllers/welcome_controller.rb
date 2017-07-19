class WelcomeController < ApplicationController
  def index
    @cities = City.all.map { |city| city.id }
  end
end
