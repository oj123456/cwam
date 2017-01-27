# == Schema Information
#
# Table name: advertisments
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
#

class Advertisment < ApplicationRecord

  validates_presence_of :title, :url, :location, :image
  validates :url, :format => URI::regexp(%w(http https))
  enum location: [:homepage, :recipes_page, :recipe_inner_page, :events_page, :interview_inner_page, :places_page, :helpers_page]
  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/advertisment/:id/:filename", :url  => "/images/advertisment/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
