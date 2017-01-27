# == Schema Information
#
# Table name: spices
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Spice < ApplicationRecord
  before_create :generate_slug

  has_many :recipe_spices, :dependent => :delete_all
  has_many :recipes, through: :recipe_spices

  validates_presence_of :title, :description, :image

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/spice/:id/:filename", :url  => "/images/spice/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
