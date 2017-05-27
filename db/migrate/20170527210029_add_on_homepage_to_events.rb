class AddOnHomepageToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :on_homepage, :boolean
  end
end
