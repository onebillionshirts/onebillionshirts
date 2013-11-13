class AddApprovedToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :approved, :boolean, default: false
  end
end
