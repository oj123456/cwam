# == Schema Information
#
# Table name: interactive_images
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  url                :string
#  location           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  order              :integer          default(0)
#

require 'test_helper'

class InteractiveImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
