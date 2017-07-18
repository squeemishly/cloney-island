class Tour < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :user_id

end
