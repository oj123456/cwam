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

require 'test_helper'

class UserFavoriteRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
