# == Schema Information
#
# Table name: homepage_images
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class HomepageImage < ApplicationRecord
  validates_presence_of :title, :image
  validates :url, :format => URI::regexp(%w(http https)), :allow_blank => true
  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/homepage/:id/:filename", :url  => "/images/homepage/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
