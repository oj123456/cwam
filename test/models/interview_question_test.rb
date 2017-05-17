# == Schema Information
#
# Table name: interview_questions
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :string
#  interview_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order        :integer          default(0)
#

require 'test_helper'

class InterviewQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
