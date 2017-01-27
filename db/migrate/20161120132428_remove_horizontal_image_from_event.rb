class RemoveHorizontalImageFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :horizontal_image_file_name
    remove_column :events, :horizontal_image_content_type
    remove_column :events, :horizontal_image_file_size
    remove_column :events, :horizontal_image_updated_at
  end
end
