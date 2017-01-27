class CreateRecipeKitchenHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_kitchen_helpers do |t|
      t.integer :recipe_id
      t.integer :kitchen_helper_id

      t.timestamps
    end
  end
end
