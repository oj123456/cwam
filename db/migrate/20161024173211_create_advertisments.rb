class CreateAdvertisments < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisments do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :location

      t.timestamps
    end
  end
end
