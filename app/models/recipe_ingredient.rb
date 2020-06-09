class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def name_and_amount
    display = "#{self.quantity} - " + "#{self.ingredient.name}" 
  end

  def self.find_or_create_from_rows(recipe, rows = [])
    self.clean_ingredient_rows(rows).each do |recipe_ingredient|
      self.find_or_create_by(
        recipe: recipe,
        ingredient: Ingredient.find_or_create_by_name_case_insensitive(recipe_ingredient[:ingredient][:name]),
        quantity: recipe_ingredient[:quantity]
        )
    end
  end

  def self.clean_ingredient_rows(rows)
    rows.find_all do |recipe_ingredient|
      recipe_ingredient[:ingredient][:name] != ""
    end
  end

end