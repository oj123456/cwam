class CreateRecipeMainIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_main_ingredients do |t|
      t.integer :recipe_id
      t.integer :main_ingredient_id

      t.timestamps
    end
  end
end
