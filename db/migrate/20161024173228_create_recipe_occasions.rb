class CreateRecipeOccasions < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_occasions do |t|
      t.integer :recipe_id
      t.integer :occasion_id

      t.timestamps
    end
  end
end
