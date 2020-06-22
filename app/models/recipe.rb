require 'sanitize'

class Recipe < ActiveRecord::Base
  
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :serving_size, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true

  def create_recipe_ingredient_from(recipe_ingredients)
    recipe_ingredients.each do |recipe_ingredient|
      if recipe_ingredient[:ingredient][:name] != ""
        RecipeIngredient.create(
          recipe: self,
          ingredient: Ingredient.find_or_create_by(name: Sanitize.fragment(recipe_ingredient[:ingredient][:name]).downcase),
          quantity: Sanitize.fragment(recipe_ingredient[:quantity])
        )
      end
    end
  end
  
end