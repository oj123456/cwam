# == Schema Information
#
# Table name: recipe_spices
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  spice_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeSpice < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :spice, :validate => true
end
