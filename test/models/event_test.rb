# == Schema Information
#
# Table name: events
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :string
#  slug                 :string
#  start_date           :datetime
#  location             :string
#  phone_number         :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  image_file_name      :string
#  image_content_type   :string
#  image_file_size      :integer
#  image_updated_at     :datetime
#  tag_line             :string
#  image_2_file_name    :string
#  image_2_content_type :string
#  image_2_file_size    :integer
#  image_2_updated_at   :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
