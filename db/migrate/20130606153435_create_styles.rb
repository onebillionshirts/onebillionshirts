class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :style_sub_category_id

      t.timestamps
    end
  end
end
