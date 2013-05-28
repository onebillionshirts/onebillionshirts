class CreateInkColorOptions < ActiveRecord::Migration
  def change
    create_table :ink_color_options do |t|
      t.text :name
      t.text :side

      t.timestamps
    end
  end
end
