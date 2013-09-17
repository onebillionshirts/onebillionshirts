class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.attachment :main_logo
      t.attachment :logo
      t.text :text
      t.string :charity_name


      t.timestamps
    end
  end
end
