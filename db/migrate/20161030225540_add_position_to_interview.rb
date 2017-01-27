class AddPositionToInterview < ActiveRecord::Migration[5.0]
  def change
    change_table :interviews do |t|
      t.string :position
    end
  end
end
