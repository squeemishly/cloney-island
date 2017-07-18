class Vendor::ToursController < ApplicationController
  def new
    @vendor = current_user
    @tour = @vendor.tours.new
  end
end