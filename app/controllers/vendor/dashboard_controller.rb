class Vendor::DashboardController < ApplicationController

  before_action :require_vendor

  def index
    @vendor = current_user
  end

  private
    def require_vendor
      render file: 'public/404' unless current_vendor?
    end
end
