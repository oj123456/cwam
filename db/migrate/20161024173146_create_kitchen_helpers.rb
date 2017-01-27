class CreateKitchenHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_helpers do |t|
      t.string :title
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
