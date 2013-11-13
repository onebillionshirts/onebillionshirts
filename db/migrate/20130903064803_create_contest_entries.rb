class CreateContestEntries < ActiveRecord::Migration
  def change
    create_table :contest_entries do |t|
      t.string :title
      t.text :description
      t.attachment :image
      t.integer :contest_id


      t.timestamps
    end
  end
end
