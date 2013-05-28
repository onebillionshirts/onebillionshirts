class CreateSizeCategories < ActiveRecord::Migration
  def change
    create_table :size_categories do |t|
      t.text :name

      t.timestamps
    end
  end
end
