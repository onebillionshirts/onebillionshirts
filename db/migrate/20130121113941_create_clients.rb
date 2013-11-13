class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.integer :zip
      t.float :price_per_shirt

      t.timestamps
    end
  end
end
