class WelcomeController < ApplicationController
  def index
    @cities = [{name: "London", description: "Has a clock"},
              {name: "Paris", description: "Has a metal tower"},
              {name: "Denver", description: "Has a scary horse"}]
  end
end
