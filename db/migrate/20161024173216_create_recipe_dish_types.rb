class CreateRecipeDishTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_dish_types do |t|
      t.integer :recipe_id
      t.integer :dish_type_id

      t.timestamps
    end
  end
end
