class AddAttachmentImageToAdvertisments < ActiveRecord::Migration
  def self.up
    change_table :advertisments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :advertisments, :image
  end
end
