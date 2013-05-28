class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :charity_id
      t.text :quantity
      t.string :other_shirt_option
      t.integer :shirt_option_id
      t.integer :shirt_sub_option_id
      t.integer :shirt_color_id
      t.text :instructions
      t.integer :client_id
      t.integer :estimated_total_shirts

      t.timestamps

    end
  end
end
