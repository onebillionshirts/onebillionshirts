class AddGroupFieldToShirtColors < ActiveRecord::Migration
  def change
    add_column :shirt_colors, :color_group_id, :integer
  end
end
