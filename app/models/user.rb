class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true

  validates :name, presence: true

  has_many :recipes
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
end