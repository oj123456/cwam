class AddAttachmentImageToDishTypes < ActiveRecord::Migration
  def self.up
    change_table :dish_types do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dish_types, :image
  end
end
