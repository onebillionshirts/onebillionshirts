class AddNewFieldOrders < ActiveRecord::Migration
  def up
    add_column :orders, :shirt_color_name, :string
  end

  def down
    remove_column :orders, :shirt_color_name
  end
end
