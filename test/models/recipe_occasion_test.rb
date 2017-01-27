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

require 'test_helper'

class RecipeOccasionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
