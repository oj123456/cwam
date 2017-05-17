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

class InterviewQuestion < ApplicationRecord
  belongs_to :interview

  validates_presence_of :title, :description

  default_scope { order(interview_id: :desc, order: :asc) }
end
