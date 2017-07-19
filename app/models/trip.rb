class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :itineraries

  validates_presence_of :start_city
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :user_id
end
