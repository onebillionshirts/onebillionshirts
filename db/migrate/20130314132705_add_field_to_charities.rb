class AddFieldToCharities < ActiveRecord::Migration
  def up
    add_column :charities, :is_default, :boolean
  end

  def down
    remove_column :charities, :is_default
  end
end
