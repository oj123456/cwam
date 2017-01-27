# == Schema Information
#
# Table name: recipe_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  rating     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RecipeReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
