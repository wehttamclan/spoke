class User < ApplicationRecord
  validates_presence_of :password, :username, :email, :first_name, :last_name, :address
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_many :orders
  has_secure_password

  enum role: ['default', 'admin']
end
