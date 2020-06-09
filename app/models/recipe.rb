require_relative "./concerns/slugifiable"

class Recipe < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # def set_ingredients_from_params(params)
  #   # self.clear_recipe_ingredients
  #   RecipeIngredient.find_or_create_from_rows(self, params[:recipe_ingredients])
  # end

  # def clear_recipe_ingredients
  #   self.recipe_ingredients = []
  # end
end