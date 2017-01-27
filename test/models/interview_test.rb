# == Schema Information
#
# Table name: interviews
#
#  id                            :integer          not null, primary key
#  title                         :string
#  description                   :string
#  slug                          :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_file_name               :string
#  image_content_type            :string
#  image_file_size               :integer
#  image_updated_at              :datetime
#  position                      :string
#  horizontal_image_file_name    :string
#  horizontal_image_content_type :string
#  horizontal_image_file_size    :integer
#  horizontal_image_updated_at   :datetime
#

require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
