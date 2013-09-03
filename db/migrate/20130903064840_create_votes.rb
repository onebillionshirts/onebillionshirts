class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :ip
      t.integer :contest_entry_id


      t.timestamps
    end
  end
end
