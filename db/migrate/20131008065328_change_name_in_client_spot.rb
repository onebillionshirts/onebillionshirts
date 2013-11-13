class ChangeNameInClientSpot < ActiveRecord::Migration

  def up
    remove_column :client_spotlights, :name
    add_column :client_spotlights, :name, :integer
  end

  def down
    add_column :client_spotlights, :name , :string
    remove_column :client_spotlights, :name
  end

end
