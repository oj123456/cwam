class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.string :url

      t.timestamps
    end
  end
end
