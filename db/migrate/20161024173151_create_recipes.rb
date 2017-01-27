class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :code
      t.string :title
      t.string :description
      t.string :slug
      t.string :serving
      t.string :timing
      t.integer :level
      t.string :hero_ingredient
      t.string :hero_ingredient_text
      t.string :ingredients
      t.string :method_of_preparation
      t.boolean :recipe_of_the_week
      t.boolean :recipe_of_the_month

      t.timestamps
    end
  end
end
