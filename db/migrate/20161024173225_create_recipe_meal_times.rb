class CreateRecipeMealTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_meal_times do |t|
      t.integer :recipe_id
      t.integer :meal_time_id

      t.timestamps
    end
  end
end
