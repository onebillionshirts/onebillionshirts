class CreateShirtColors < ActiveRecord::Migration
  def change
    create_table :shirt_colors do |t|
      t.text :code

      t.timestamps
    end
  end
end
