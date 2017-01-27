class AddAttachmentHorizontalImageToInterviews < ActiveRecord::Migration
  def self.up
    change_table :interviews do |t|
      t.attachment :horizontal_image
    end
  end

  def self.down
    remove_attachment :interviews, :horizontal_image
  end
end
