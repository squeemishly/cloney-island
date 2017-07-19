class CreateCity < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :place_id
    end
  end
end
