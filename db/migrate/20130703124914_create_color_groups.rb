class CreateColorGroups < ActiveRecord::Migration
  def change
    create_table :color_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
