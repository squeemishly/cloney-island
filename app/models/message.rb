class Message < ApplicationRecord
  belongs_to :user
  belongs_to :private_chat
end
