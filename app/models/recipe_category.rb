class RecipeCategory < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :category
  belongs_to :user
end