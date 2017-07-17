class User < ApplicationRecord
  has_secure_password
  has_many :trips
  enum role: [:user, :admin]

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :password
  validates_presence_of :status
  validates_presence_of :role

end
