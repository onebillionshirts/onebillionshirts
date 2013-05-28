class CreateSuggestedCharities < ActiveRecord::Migration
  def change
    create_table :suggested_charities do |t|
      t.string :url
      t.string :suggested_by
      t.timestamps
    end
  end
end
