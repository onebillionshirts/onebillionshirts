class CreateOrderFiles < ActiveRecord::Migration
  def change
    create_table :order_files do |t|
      t.integer :order_id
      t.string :side
      t.attachment :image

      t.timestamps
    end
  end
end
