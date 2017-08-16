class PrivateChat < ApplicationRecord
  has_many :messages

  before_save :canonicalize_ids

  def canonicalize_ids
    self.participant_ids = self.participant_ids.map {|v| v.to_i }.uniq.sort
  end
end