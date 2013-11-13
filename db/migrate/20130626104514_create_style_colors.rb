class CreateStyleColors < ActiveRecord::Migration
  def change
    create_table :style_colors do |t|
      t.integer :style_id
      t.integer :shirt_color_id

      t.timestamps
    end
  end
end
