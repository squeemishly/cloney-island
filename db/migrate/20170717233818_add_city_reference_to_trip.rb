class AddCityReferenceToTrip < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :city, foreign_key: true, index: true
  end
end
