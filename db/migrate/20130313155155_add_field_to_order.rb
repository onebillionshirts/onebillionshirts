class AddFieldToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :deadline, :date
  end

  def down
    remove_column :orders, :deadline
  end
end
