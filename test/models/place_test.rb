# == Schema Information
#
# Table name: places
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  slug               :string
#  longitude          :decimal(, )
#  latitude           :decimal(, )
#  is_favorite        :boolean
#  is_new             :boolean
#  place_type         :integer
#  place_category_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
