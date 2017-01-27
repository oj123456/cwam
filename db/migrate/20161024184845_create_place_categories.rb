class CreatePlaceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :place_categories do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
