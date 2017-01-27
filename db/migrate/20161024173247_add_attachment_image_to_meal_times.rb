class AddAttachmentImageToMealTimes < ActiveRecord::Migration
  def self.up
    change_table :meal_times do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :meal_times, :image
  end
end
