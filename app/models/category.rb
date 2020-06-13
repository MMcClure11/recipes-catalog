class Category < ActiveRecord::Base

  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  before_validation :trim_whitespace
  validates :name, presence: true 

  def trim_whitespace
    name&.strip
  end

end