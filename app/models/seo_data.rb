# == Schema Information
#
# Table name: seo_data
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  keywords           :string
#  page               :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class SeoData < ApplicationRecord

  validates_presence_of :title, :description, :keywords, :image

  enum page: [:home, :recipes, :news, :features, :restaurants, :about]

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/seo/:id/:filename", :url  => "/images/seo/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
