# == Schema Information
#
# Table name: competitions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  slug        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CompetitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
