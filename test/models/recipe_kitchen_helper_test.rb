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

require 'test_helper'

class RecipeKitchenHelperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
