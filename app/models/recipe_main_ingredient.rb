# == Schema Information
#
# Table name: recipe_main_ingredients
#
#  id                 :integer          not null, primary key
#  recipe_id          :integer
#  main_ingredient_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RecipeMainIngredient < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :main_ingredient, :validate => true
end
