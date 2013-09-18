class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.attachment :logo
      t.attachment :charity_logo
      t.text :text
      t.string :charity_name
      t.integer :charity_id


      t.timestamps
    end
  end
end
