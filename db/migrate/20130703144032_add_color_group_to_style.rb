class AddColorGroupToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :color_group_id, :integer
  end
end