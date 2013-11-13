class CreateClientSpotlights < ActiveRecord::Migration
  def change
    create_table :client_spotlights do |t|

      t.string :description
      t.string :name
      t.string :client_spotlight_type

      t.timestamps
    end
  end
end
