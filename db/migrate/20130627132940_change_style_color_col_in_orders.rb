class ChangeStyleColorColInOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :style_color
    add_column :orders, :shirt_color_id, :integer
  end
end
