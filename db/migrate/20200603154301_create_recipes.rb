class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.text :instructions
      t.text :ingredients
      t.string :serving_size
      t.string :cook_time
    end
  end
end
