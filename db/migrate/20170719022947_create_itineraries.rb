class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.references :trip, foreign_key: true, index: true
      t.references :place, foreign_key: true, index: true
      t.date :date
    end
  end
end
