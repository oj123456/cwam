# == Schema Information
#
# Table name: interactive_images
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
#  order              :integer          default(0)
#

class InteractiveImage < ApplicationRecord
  default_scope { order(:order) }
  validates_presence_of :title, :image, :location
  validates :url, :format => URI::regexp(%w(http https)), :allow_blank => true
  if Rails.env.production?
    has_attached_file :image, {
      :path => "/var/www/public/images/interactive_images/:id/:filename",
      :url  => "/images/interactive_images/:id/:filename"
    }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  enum location: [:homepage, :dining_out]
end
