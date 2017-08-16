class UpdateMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :body
    remove_column :messages, :read
    add_column :messages, :content, :string
    add_reference :messages, :private_chat, foreign_key: true
  end
end
