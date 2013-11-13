class UpdateSpotlightDescriptionType < ActiveRecord::Migration
  def up
    remove_column :client_spotlights, :description
    add_column :client_spotlights, :description, :text
  end

  def down

  end
end
