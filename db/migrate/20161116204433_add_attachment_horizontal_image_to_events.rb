class AddAttachmentHorizontalImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :horizontal_image
    end
  end

  def self.down
    remove_attachment :events, :horizontal_image
  end
end
