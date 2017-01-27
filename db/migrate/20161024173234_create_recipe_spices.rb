class CreateRecipeSpices < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_spices do |t|
      t.integer :recipe_id
      t.integer :spice_id

      t.timestamps
    end
  end
end
