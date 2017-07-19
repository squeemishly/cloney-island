class Admin::QueryController < ApplicationController
  def index
    @user = User.find_by(email: params[:query])
  end
end