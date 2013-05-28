class CreateShirtSubOptions < ActiveRecord::Migration
  def change
    create_table :shirt_sub_options do |t|
      t.text :name

      t.timestamps
    end
  end
end
