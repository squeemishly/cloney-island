class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true, index: true
      t.string :start_city
    end
  end
end
