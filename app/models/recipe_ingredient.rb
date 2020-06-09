class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def name_and_amount
    display = "#{self.quantity} - " + "#{self.ingredient.name}" 
  end

end