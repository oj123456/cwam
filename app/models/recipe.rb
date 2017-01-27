# == Schema Information
#
# Table name: recipes
#
#  id                            :integer          not null, primary key
#  code                          :string
#  title                         :string
#  description                   :string
#  slug                          :string
#  serving                       :string
#  timing                        :string
#  level                         :integer
#  hero_ingredient               :string
#  hero_ingredient_text          :string
#  ingredients                   :string
#  method_of_preparation         :string
#  recipe_of_the_week            :boolean
#  recipe_of_the_month           :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_file_name               :string
#  image_content_type            :string
#  image_file_size               :integer
#  image_updated_at              :datetime
#  reviews_average               :decimal(, )      default(0.0)
#  reviews_count                 :integer          default(0)
#  horizontal_image_file_name    :string
#  horizontal_image_content_type :string
#  horizontal_image_file_size    :integer
#  horizontal_image_updated_at   :datetime
#

require 'roo'

class Recipe < ApplicationRecord
  before_create :generate_slug

  has_many :recipe_dish_types, :dependent => :delete_all, :autosave => true
  has_many :dish_types, through: :recipe_dish_types
  has_many :recipe_kitchen_helpers, :dependent => :delete_all, :autosave => true
  has_many :kitchen_helpers, through: :recipe_kitchen_helpers
  has_many :recipe_main_ingredients, :dependent => :delete_all, :autosave => true
  has_many :main_ingredients, through: :recipe_main_ingredients
  has_many :recipe_meal_times, :dependent => :delete_all, :autosave => true
  has_many :meal_times, through: :recipe_meal_times
  has_many :recipe_occasions, :dependent => :delete_all, :autosave => true
  has_many :occasions, through: :recipe_occasions
  has_many :recipe_spices, :dependent => :delete_all, :autosave => true
  has_many :spices, through: :recipe_spices
  has_many :recipe_reviews, :dependent => :delete_all, :autosave => true

  validates_presence_of :code, :title, :description, :serving, :timing, :level, :hero_ingredient, :hero_ingredient_text, :ingredients, :method_of_preparation, :image

  if Rails.env.production?
    has_attached_file :image, { :path => "/var/www/public/images/recipe/:id/:filename", :url  => "/images/recipe/:id/:filename" }
  else
    has_attached_file :image
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  if Rails.env.production?
    has_attached_file :horizontal_image, { :path => "/var/www/public/images/recipe/:id/:filename", :url  => "/images/recipe/:id/:filename" }
  else
    has_attached_file :horizontal_image
  end
  validates_attachment_content_type :horizontal_image, :content_type => /\Aimage\/.*\Z/


  enum level: [:easy, :medium, :hard]

  def dish_types_concat
    if self.dish_types
      return self.dish_types.map(&:title).join(', ').upcase
    else
      return ''
    end
  end

  def self.filter_recipes(filters, pagination)
    recipes = Recipe.all
    filtered_by = ''

    if filters[:dish_type].present?
      param_text = filters[:dish_type].to_s.strip
      if !param_text.empty?
        param = DishType.where(slug: param_text).first
        if param
          recipes = recipes.joins(:recipe_dish_types).where(recipe_dish_types: {dish_type_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end
    if filters[:main_ingredient].present?
      param_text = filters[:main_ingredient].to_s.strip
      if !param_text.empty?
        param = MainIngredient.where(slug: param_text).first
        if param
          recipes = recipes.joins(:recipe_main_ingredients).where(recipe_main_ingredients: {main_ingredient_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end
    if filters[:occasion].present?
      param_text = filters[:occasion].to_s.strip
      if !param_text.empty?
        param = Occasion.where(slug: param_text).first
        if param
          recipes = recipes.joins(:recipe_occasions).where(recipe_occasions: {occasion_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end
    if filters[:meal_time].present?
      param_text = filters[:meal_time].to_s.strip
      if !param_text.empty?
        param = MealTime.where(slug: param_text).first
        if param
          recipes = recipes.joins(:meal_times).where(recipe_meal_times: {meal_time_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end
    if filters[:spice].present?
      param_text = filters[:spice].to_s.strip
      if !param_text.empty?
        param = Spice.where(slug: param_text).first
        if param
          recipes = recipes.joins(:spices).where(recipe_spices: {spice_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end
    if filters[:kitchen_helper].present?
      param_text = filters[:kitchen_helper].to_s.strip
      if !param_text.empty?
        param = KitchenHelper.where(slug: param_text).first
        if param
          recipes = recipes.joins(:kitchen_helpers).where(recipe_kitchen_helpers: {kitchen_helper_id: param.id})
          filtered_by += ', ' if !filtered_by.empty?
          filtered_by += param.title
        end
      end
    end

    if pagination[:limit].present? && pagination[:limit] > 0
      recipes = recipes.limit(pagination[:limit])
    end
    if pagination[:offset].present? && pagination[:offset] > 0
      recipes = recipes.offset(pagination[:offset])
    end

    return recipes, filtered_by
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    (4..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      r = Recipe.create(
                    code: row["code"],
                    title: row["name"],
                    description: row["description"].to_s.empty? ? '-' : row["description"],
                    serving: row["serves"],
                    timing: row["time"],
                    image: File.open('/var/www/public/images/missing.png'),
                    level: Recipe.levels["easy"],
                    hero_ingredient: row["hero_ingredient"],
                    hero_ingredient_text: row["hero_ingredient_text"],
                    ingredients: '-',
                    method_of_preparation: '-'
      )

      if !row["herbs"].to_s.empty? && row["herbs"].to_s != 'NA'
        row["herbs"].split(',').each do |name|
          name = name.capitalize
          i = Spice.where(title: name).first
          if !i
            i = Spice.create(title: name, description: name, image: File.open('/var/www/public/images/missing.png'))
          end
          RecipeSpice.create(recipe_id: r.id, spice_id: i.id)
        end
      end

      if !row["dish_type"].to_s.empty? && row["dish_type"].to_s != 'NA'
        row["dish_type"].split('/').each do |name|
          name = name.capitalize
          i = DishType.where(title: name).first
          if !i
            i = DishType.create(title: name, description: name, image: File.open('/var/www/public/images/missing.png'))
          end
          RecipeDishType.create(recipe_id: r.id, dish_type_id: i.id)
        end
      end

      if !row["main_ingredients"].to_s.empty? && row["main_ingredients"].to_s != 'NA'
       row["main_ingredients"].split('/').each do |name|
          name = name.capitalize
          i = MainIngredient.where(title: name).first
          if !i
            i = MainIngredient.create(title: name, description: name, image: File.open('/var/www/public/images/missing.png'))
          end
          RecipeMainIngredient.create(recipe_id: r.id, main_ingredient_id: i.id)
        end
      end

      if !row["meals_courses"].to_s.empty? && row["meals_courses"].to_s != 'NA'
       row["meals_courses"].split('/').each do |name|
          name = name.capitalize
          i = MealTime.where(title: name).first
          if !i
            i = MealTime.create(title: name, description: name, image: File.open('/var/www/public/images/missing.png'))
          end
          RecipeMealTime.create(recipe_id: r.id, meal_time_id: i.id)
        end
      end

      if !row["occasion"].to_s.empty? && row["occasion"].to_s != 'NA'
       row["occasion"].split('/').each do |name|
          name = name.capitalize
          i = Occasion.where(title: name).first
          if !i
            i = Occasion.create(title: name, description: name, image: File.open('/var/www/public/images/missing.png'))
          end
          RecipeOccasion.create(recipe_id: r.id, occasion_id: i.id)
        end
      end

    end
  end
end
