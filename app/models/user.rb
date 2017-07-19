class User < ApplicationRecord
  has_secure_password
  enum role: [:user, :vendor, :admin]

  has_many :trips, dependent: :destroy
  has_many :tours

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :password_digest
  validates_presence_of :status
  validates_presence_of :role
end
