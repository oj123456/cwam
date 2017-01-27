# == Schema Information
#
# Table name: meal_times
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

class MealTime < ApplicationRecord
  before_create :generate_slug

  has_many :recipe_meal_times, :dependent => :delete_all
  has_many :recipes, through: :recipe_meal_times

  validates_presence_of :title, :image

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/meal_time/:id/:filename", :url  => "/images/meal_time/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
