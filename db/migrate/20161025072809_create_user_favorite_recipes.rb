class CreateUserFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorite_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
