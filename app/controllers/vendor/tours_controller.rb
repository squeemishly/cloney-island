class Vendor::ToursController < ApplicationController
  def new
    @vendor = current_user
    @tour = @vendor.tours.new
  end

  def create
    @vendor = current_user
    @tour = @vendor.tours.new(tour_params)
    if @tour.save
      redirect_to vendor_tour_path(@tour)
    else
      render :new
    end
  end

  def show
    @vendor = current_user
    @tour = @vendor.tours.find_by(id: params[:id])
  end

  private
    def tour_params
      params.require(:tour).permit(:name, :description, :price)
    end
end