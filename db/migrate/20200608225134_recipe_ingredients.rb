class RecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
    end
  end
end
