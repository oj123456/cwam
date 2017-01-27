# == Schema Information
#
# Table name: press_releases
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  slug               :string
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class PressReleaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
