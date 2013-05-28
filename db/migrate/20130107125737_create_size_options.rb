class CreateSizeOptions < ActiveRecord::Migration
  def change
    create_table :size_options do |t|
      t.string :name

      t.timestamps
    end
  end
end
