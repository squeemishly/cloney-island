class RemoveConversationIdFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :messages, :conversation, index: true
  end
end
