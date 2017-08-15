class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :itineraries
  # has_many :places, through: :itineraries

  validates_presence_of :start_city
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :user_id

  def with_dates
    "#{start_city}, #{start_date} - #{end_date}"
  end

  def days
    return [] unless start_date && end_date
    (start_date..end_date).to_a
  end

  def sorted_itineraries
    self.itineraries.order(:date)
  end
end
