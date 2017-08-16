class CreatePrivateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :private_chats do |t|
      t.string :participant_ids, array: true, default: []
    end
  end
end
