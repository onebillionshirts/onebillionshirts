class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :quantity
      t.integer :n_s
      t.integer :n_m
      t.integer :n_l
      t.integer :n_xl
      t.integer :n_xxl
      t.integer :style_id
      t.integer :f_c
      t.integer :b_c
      t.integer :charity_id
      t.boolean :style_color

      t.timestamps
    end
  end
end
