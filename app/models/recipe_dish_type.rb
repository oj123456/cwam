# == Schema Information
#
# Table name: recipe_dish_types
#
#  id           :integer          not null, primary key
#  recipe_id    :integer
#  dish_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RecipeDishType < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :dish_type, :validate => true
end
