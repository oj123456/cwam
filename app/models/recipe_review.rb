# == Schema Information
#
# Table name: recipe_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  rating     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeReview < ApplicationRecord
  belongs_to :recipe, :validate => true
  belongs_to :user, :validate => true

  after_save :update_recipe_reviews!


  private
  def update_recipe_reviews!
    reviews = self.recipe.recipe_reviews
    reviews_count = reviews.count
    reviews_average = reviews.sum(:rating) / reviews_count

    self.recipe.reviews_count = reviews_count
    self.recipe.reviews_average = reviews_average
    self.recipe.save!
  end

end
