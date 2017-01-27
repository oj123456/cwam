class AddAttachmentImageToSpices < ActiveRecord::Migration
  def self.up
    change_table :spices do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spices, :image
  end
end
