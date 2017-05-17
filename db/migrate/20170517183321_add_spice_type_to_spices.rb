class AddSpiceTypeToSpices < ActiveRecord::Migration[5.0]
  def change
    add_column :spices, :spice_type, :integer
  end
end
