class PrivateChat < ApplicationRecord
  has_many :messages

  before_save :canonicalize_ids

  def canonicalize_ids
    self.participant_ids = self.participant_ids.map {|v| v.to_i }.uniq.sort
  end

  def self.find_my_chats(id)
    PrivateChat.find_by_sql [
      "SELECT id 
      FROM Private_Chats 
      WHERE '#{id}' = ANY(participant_ids)"
    ]
  end
end