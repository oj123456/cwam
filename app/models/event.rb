# == Schema Information
#
# Table name: events
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :string
#  slug                 :string
#  start_date           :datetime
#  location             :string
#  phone_number         :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  image_file_name      :string
#  image_content_type   :string
#  image_file_size      :integer
#  image_updated_at     :datetime
#  tag_line             :string
#  image_2_file_name    :string
#  image_2_content_type :string
#  image_2_file_size    :integer
#  image_2_updated_at   :datetime
#  end_date             :datetime
#  on_homepage          :boolean
#

class Event < ApplicationRecord
  before_create :generate_slug

  validates_presence_of :title, :tag_line, :description, :start_date, :location, :image, :image_2

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/event/:id/:filename", :url  => "/images/event/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  if Rails.env.production?
    has_attached_file :image_2, { :path => "/var/www/public/images/event/:id/:filename", :url  => "/images/event/:id/:filename" }
  else
    has_attached_file :image_2
  end
  validates_attachment_content_type :image_2, :content_type => /\Aimage\/.*\Z/


  def format_date(date)
    return date.strftime("%A, %d of %B, %Y starting %I %p")
  end
end
