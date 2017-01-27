class AddAttachmentImage2ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :image_2
    end
  end

  def self.down
    remove_attachment :events, :image_2
    remove_attachment :events, :horizontal_image
  end
end
