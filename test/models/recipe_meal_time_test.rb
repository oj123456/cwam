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

require 'test_helper'

class RecipeMealTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
