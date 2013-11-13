class AddAttachmentFrontArtToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.attachment :front_art
    end
  end

  def self.down
    drop_attached_file :orders, :front_art
  end
end
