# == Schema Information
#
# Table name: interviews
#
#  id                            :integer          not null, primary key
#  title                         :string
#  description                   :string
#  slug                          :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_file_name               :string
#  image_content_type            :string
#  image_file_size               :integer
#  image_updated_at              :datetime
#  position                      :string
#  horizontal_image_file_name    :string
#  horizontal_image_content_type :string
#  horizontal_image_file_size    :integer
#  horizontal_image_updated_at   :datetime
#  on_homepage                   :boolean
#

class Interview < ApplicationRecord
  before_create :generate_slug

  has_many :interview_questions

  validates_presence_of :title, :image, :horizontal_image

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/interview/:id/:filename", :url  => "/images/interview/:id/:filename" }
  else
    has_attached_file :image
  end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  if Rails.env.production?
    has_attached_file :horizontal_image, { :path => "/var/www/public/images/interview/:id/:filename", :url  => "/images/interview/:id/:filename" }
  else
    has_attached_file :horizontal_image
  end
  validates_attachment_content_type :horizontal_image, :content_type => /\Aimage\/.*\Z/


end
