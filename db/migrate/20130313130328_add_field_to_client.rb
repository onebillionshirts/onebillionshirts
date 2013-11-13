class AddFieldToClient < ActiveRecord::Migration
  def up
    add_column :clients, :reference_id, :integer
  end

  def down
    remove_column :clients, :reference_id
  end
end
