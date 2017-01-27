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

require 'test_helper'

class RecipeSpiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
