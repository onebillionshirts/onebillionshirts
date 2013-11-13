class CreateMatrixCols < ActiveRecord::Migration
  def change
    create_table :matrix_cols do |t|
      t.decimal :c_1, precision:16, scale:2
      t.decimal :c_2, precision:16, scale:2
      t.decimal :c_3, precision:16, scale:2
      t.decimal :c_4, precision:16, scale:2
      t.decimal :c_5, precision:16, scale:2
      t.decimal :c_6, precision:16, scale:2
      t.integer :matrix_id
      t.integer :count
      t.timestamps
    end
  end
end
