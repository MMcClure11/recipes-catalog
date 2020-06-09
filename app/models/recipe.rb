require_relative "./concerns/slugifiable"

class Recipe < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  # has_many :recipe_ingredients
  # has_many :ingredients, through: :recipe_ingredients
end