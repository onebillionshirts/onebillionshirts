class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title
      t.date :end_date
      t.date :start_date

      t.timestamps
    end
  end
end
