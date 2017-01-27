class AddAttachmentImageToInterviews < ActiveRecord::Migration
  def self.up
    change_table :interviews do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :interviews, :image
  end
end
