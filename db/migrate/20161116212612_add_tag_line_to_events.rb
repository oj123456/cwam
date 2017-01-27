class AddTagLineToEvents < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.string :tag_line
    end
  end
end
