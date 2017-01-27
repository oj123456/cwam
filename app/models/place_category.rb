# == Schema Information
#
# Table name: place_categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlaceCategory < ApplicationRecord
  has_many :places
  validates_presence_of :title
end
