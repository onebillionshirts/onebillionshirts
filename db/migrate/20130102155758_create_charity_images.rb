class CreateCharityImages < ActiveRecord::Migration
  def change
    create_table :charity_images do |t|
      t.integer :charity_id
      t.attachment :image

      t.timestamps
    end
  end
end
