class AddAttachmentImageToSeoData < ActiveRecord::Migration
  def self.up
    change_table :seo_data do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :seo_data, :image
  end
end
