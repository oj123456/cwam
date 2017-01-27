# == Schema Information
#
# Table name: recipe_meal_times
#
#  id           :integer          not null, primary key
#  recipe_id    :integer
#  meal_time_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RecipeMealTime < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :meal_time, :validate => true
end
