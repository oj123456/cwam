# == Schema Information
#
# Table name: advertisments
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
#

require 'test_helper'

class AdvertismentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end