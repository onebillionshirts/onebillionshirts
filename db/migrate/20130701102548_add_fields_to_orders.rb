class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone, :string
    add_column :orders, :zip, :string
  end
end
