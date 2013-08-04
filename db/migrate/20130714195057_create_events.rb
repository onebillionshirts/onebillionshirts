class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :website
      t.datetime :start_time
      t.datetime :time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
