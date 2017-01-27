class CreateSeoData < ActiveRecord::Migration[5.0]
  def change
    create_table :seo_data do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.integer :page

      t.timestamps
    end
  end
end
