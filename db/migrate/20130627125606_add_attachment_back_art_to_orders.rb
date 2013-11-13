class AddAttachmentBackArtToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.attachment :back_art
    end
  end

  def self.down
    drop_attached_file :orders, :back_art
  end
end
