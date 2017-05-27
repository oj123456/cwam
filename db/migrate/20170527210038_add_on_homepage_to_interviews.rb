class AddOnHomepageToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :on_homepage, :boolean
  end
end
