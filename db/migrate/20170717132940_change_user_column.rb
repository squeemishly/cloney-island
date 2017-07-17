class ChangeUserColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :status, :integer, default: 0
  end
end
