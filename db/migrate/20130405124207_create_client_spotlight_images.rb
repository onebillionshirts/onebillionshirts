class CreateClientSpotlightImages < ActiveRecord::Migration
  def change
    create_table :client_spotlight_images do |t|
      t.integer :client_spotlight_id
      t.attachment :asset
      t.timestamps
    end
  end
end
