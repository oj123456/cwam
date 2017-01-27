class AddAttachmentImageToPressReleases < ActiveRecord::Migration
  def self.up
    change_table :press_releases do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :press_releases, :image
  end
end
