class CreateRecipeReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_reviews do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.decimal :rating

      t.timestamps
    end
  end
end
