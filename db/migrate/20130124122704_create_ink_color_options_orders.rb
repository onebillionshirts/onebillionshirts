class CreateInkColorOptionsOrders < ActiveRecord::Migration
  def change
    create_table :ink_color_options_orders, :id => false do |t|
      t.integer :order_id
      t.integer :ink_color_option_id
    end
  end
end
