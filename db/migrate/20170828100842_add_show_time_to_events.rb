class AddShowTimeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :show_time, :boolean
  end
end
