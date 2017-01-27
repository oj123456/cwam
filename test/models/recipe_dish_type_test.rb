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

require 'test_helper'

class RecipeDishTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
