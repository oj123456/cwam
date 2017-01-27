class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.datetime :start_date
      t.string :location
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
