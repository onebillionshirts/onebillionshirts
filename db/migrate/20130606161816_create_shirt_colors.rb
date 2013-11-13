class CreateShirtColors < ActiveRecord::Migration
  def change
    create_table :shirt_colors do |t|
      t.text :code
      t.string :name
      t.timestamps
    end
  end
end
