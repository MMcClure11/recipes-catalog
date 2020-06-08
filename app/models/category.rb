require_relative "./concerns/slugifiable"

class Category < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
end