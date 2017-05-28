# == Schema Information
#
# Table name: press_releases
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  slug               :string
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class PressRelease < ApplicationRecord
  before_create :generate_slug

  validates_presence_of :title, :image
  # validates :url, :format => URI::regexp(%w(http https))
  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/press_release/:id/:filename", :url  => "/images/press_release/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def showing_url
    if self.url.empty?
      return self.image.url
    else
      return self.url
    end
  end
end
