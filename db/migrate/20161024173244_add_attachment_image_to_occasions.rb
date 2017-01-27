class AddAttachmentImageToOccasions < ActiveRecord::Migration
  def self.up
    change_table :occasions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :occasions, :image
  end
end
