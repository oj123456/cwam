# == Schema Information
#
# Table name: recipe_occasions
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  occasion_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RecipeOccasion < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :occasion, :validate => true
end
