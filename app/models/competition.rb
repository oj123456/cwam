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

class Competition < ApplicationRecord
  before_create :generate_slug

  validates_presence_of :title, :description, :url
  validates :url, :format => URI::regexp(%w(http https))
end
