class AddAttachmentImageToMainIngredients < ActiveRecord::Migration
  def self.up
    change_table :main_ingredients do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :main_ingredients, :image
  end
end
