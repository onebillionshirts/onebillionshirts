class CreateOrderSizeValues < ActiveRecord::Migration
  def change
    create_table :order_size_values do |t|
      t.integer :order_id
      t.integer :size_category_id
      t.integer :size_option_id
      t.text :value

      t.timestamps
    end
  end
end
