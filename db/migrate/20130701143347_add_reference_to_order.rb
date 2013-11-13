class AddReferenceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :reference_id, :integer
  end
end
