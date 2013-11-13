class ChangeFieldOfEvent < ActiveRecord::Migration
  def up
    remove_column :events, :time
    add_column :events, :time, :string
  end
end
