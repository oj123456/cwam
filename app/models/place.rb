# == Schema Information
#
# Table name: places
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  slug               :string
#  longitude          :decimal(, )
#  latitude           :decimal(, )
#  is_favorite        :boolean
#  is_new             :boolean
#  place_type         :integer
#  place_category_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Place < ApplicationRecord
  before_create :generate_slug

  belongs_to :place_category, :validate => true

  validates_presence_of :title, :description, :place_type, :place_category_id, :longitude, :latitude, :image

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/place/:id/:filename", :url  => "/images/place/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  enum place_type: [:restaurant, :shop]
  
end
