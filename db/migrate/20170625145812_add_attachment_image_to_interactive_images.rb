class AddAttachmentImageToInteractiveImages < ActiveRecord::Migration
  def self.up
    change_table :interactive_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :interactive_images, :image
  end
end
