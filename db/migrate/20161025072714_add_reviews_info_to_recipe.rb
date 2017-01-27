class AddReviewsInfoToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :reviews_average, :decimal, default: 0
    add_column :recipes, :reviews_count, :integer, default: 0
  end
end
