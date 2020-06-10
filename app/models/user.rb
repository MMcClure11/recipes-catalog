require_relative "./concerns/slugifiable"

class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_secure_password

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