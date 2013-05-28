class CreateShirtOptions < ActiveRecord::Migration
  def change
    create_table :shirt_options do |t|
      t.text :name

      t.timestamps
    end
  end
end
