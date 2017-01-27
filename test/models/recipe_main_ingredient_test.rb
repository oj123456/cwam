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

require 'test_helper'

class RecipeMainIngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
