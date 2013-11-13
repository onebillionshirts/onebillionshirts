class AddExtraFieldsToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :material, :string
    add_column :styles, :cost_level, :integer
  end
end
