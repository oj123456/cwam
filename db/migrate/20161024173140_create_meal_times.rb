class CreateMealTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_times do |t|
      t.string :title
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
