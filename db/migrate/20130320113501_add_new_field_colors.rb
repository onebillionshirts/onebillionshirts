class AddNewFieldColors < ActiveRecord::Migration
  def up
    add_column :shirt_colors, :name, :string
  end

  def down
    remove_column :shirt_colors, :name
  end
end
