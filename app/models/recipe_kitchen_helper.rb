# == Schema Information
#
# Table name: recipe_kitchen_helpers
#
#  id                :integer          not null, primary key
#  recipe_id         :integer
#  kitchen_helper_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class RecipeKitchenHelper < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :kitchen_helper, :validate => true
end
