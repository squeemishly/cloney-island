class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :google_place_id
      t.string :name
      t.float :lat
      t.float :lng
    end
  end
end
