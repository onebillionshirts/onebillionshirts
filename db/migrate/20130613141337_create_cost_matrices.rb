class CreateCostMatrices < ActiveRecord::Migration
  def change
    create_table :cost_matrices do |t|
      t.string :name

      t.timestamps
    end
  end
end
