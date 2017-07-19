class AddCountryToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :country, :string
  end
end
