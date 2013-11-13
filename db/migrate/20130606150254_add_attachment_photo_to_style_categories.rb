class AddAttachmentPhotoToStyleCategories < ActiveRecord::Migration
  def self.up
    change_table :style_categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :style_categories, :photo
  end
end
