class AddAttachmentImageToKitchenHelpers < ActiveRecord::Migration
  def self.up
    change_table :kitchen_helpers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kitchen_helpers, :image
  end
end
