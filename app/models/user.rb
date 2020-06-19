class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { in: 6..20}, unless: ->(u){u.password.blank?}

  validates :username, uniqueness: true
  validates :username, presence: true

  validates :name, presence: true

  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :recipes
  has_many :recipe_categories, through: :recipes
  has_many :categories, through: :recipe_categories

  has_many :recipe_ingredients, through: :recipes
  has_many :ingredients, through: :recipe_ingredients
end