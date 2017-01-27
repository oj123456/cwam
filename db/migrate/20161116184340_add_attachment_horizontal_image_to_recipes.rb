class AddAttachmentHorizontalImageToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :horizontal_image
    end
  end

  def self.down
    remove_attachment :recipes, :horizontal_image
  end
end
