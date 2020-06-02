class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true

  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :recipes
end