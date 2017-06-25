class AddOrderToInteractiveImages < ActiveRecord::Migration[5.0]
  def change
    add_column :interactive_images, :order, :integer, default: 0
  end
end
