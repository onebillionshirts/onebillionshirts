class AddLaterToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :later, :boolean, default: false
  end
end
