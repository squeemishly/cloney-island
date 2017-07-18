class Vendor::ToursController < ApplicationController

  before_action :require_vendor, except: [:show]

  def new
    @vendor = current_user
    @tour = @vendor.tours.new
  end

  def create
    @vendor = current_user
    @tour = @vendor.tours.new(tour_params)
    if @tour.save
      redirect_to user_vendor_tour_path(@vendor, @tour)
    else
      render :new
    end
  end

  def show
    @vendor = User.find_by(id: params[:user_id])
    @tour = @vendor.tours.find_by(id: params[:id])
  end

  def edit
    @vendor = current_user
    @tour = @vendor.tours.find_by(id: params[:id])
  end

  def update
    @vendor = current_user
    @tour = @vendor.tours.find_by(id: params[:format])
    @tour.update(tour_params)
    redirect_to user_vendor_tour_path(@vendor, @tour)
  end

  private
    def tour_params
      params.require(:tour).permit(:name, :description, :price)
    end

    def require_vendor
      render file: 'public/404' unless current_vendor?
    end
end