# == Schema Information
#
# Table name: recipes
#
#  id                            :integer          not null, primary key
#  code                          :string
#  title                         :string
#  description                   :string
#  slug                          :string
#  serving                       :string
#  timing                        :string
#  level                         :integer
#  hero_ingredient               :string
#  hero_ingredient_text          :string
#  ingredients                   :string
#  method_of_preparation         :string
#  recipe_of_the_week            :boolean
#  recipe_of_the_month           :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_file_name               :string
#  image_content_type            :string
#  image_file_size               :integer
#  image_updated_at              :datetime
#  reviews_average               :decimal(, )      default(0.0)
#  reviews_count                 :integer          default(0)
#  horizontal_image_file_name    :string
#  horizontal_image_content_type :string
#  horizontal_image_file_size    :integer
#  horizontal_image_updated_at   :datetime
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
