class Ingredient < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients  

  def self.find_or_create_by_name_case_insensitive(name)
    self.where('lower(name) = ?', name.downcase).find_or_create_by(name: name)
  end

end