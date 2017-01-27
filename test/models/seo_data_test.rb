# == Schema Information
#
# Table name: seo_data
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  keywords           :string
#  page               :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class SeoDataTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
