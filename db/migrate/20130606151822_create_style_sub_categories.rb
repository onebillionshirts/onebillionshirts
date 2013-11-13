class CreateStyleSubCategories < ActiveRecord::Migration
  def change
    create_table :style_sub_categories do |t|
      t.string :name
      t.integer :style_category_id

      t.timestamps
    end
  end
end
