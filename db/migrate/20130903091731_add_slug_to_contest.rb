class AddSlugToContest < ActiveRecord::Migration
  def change
    add_column :contests, :slug, :string
    add_index :contests, :slug, unique: true
  end
end
