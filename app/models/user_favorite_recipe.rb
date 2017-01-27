# == Schema Information
#
# Table name: user_favorite_recipes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserFavoriteRecipe < ApplicationRecord
  belongs_to :user, :validate => true
  belongs_to :recipe, :validate => true
end
