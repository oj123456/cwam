class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.decimal :longitude
      t.decimal :latitude
      t.boolean :is_favorite
      t.boolean :is_new
      t.integer :place_type
      t.integer :place_category_id

      t.timestamps
    end
  end
end
