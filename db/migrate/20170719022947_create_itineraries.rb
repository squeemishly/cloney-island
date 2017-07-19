class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.references :trips, foreign_key: true, index: true
      t.references :places, foreign_key: true, index: true
      t.date :date
    end
  end
end
