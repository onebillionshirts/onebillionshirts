class AddFieldsToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :price_white, :decimal, precision: 16, scale: 2
    add_column :styles, :price_color, :decimal, precision: 16, scale: 2
    add_column :styles, :m_24, :decimal, precision: 16, scale: 2
    add_column :styles, :m_48, :decimal, precision: 16, scale: 2
    add_column :styles, :m_72, :decimal, precision: 16, scale: 2
    add_column :styles, :m_144, :decimal, precision: 16, scale: 2
    add_column :styles, :m_288, :decimal, precision: 16, scale: 2
    add_column :styles, :m_576, :decimal, precision: 16, scale: 2
    add_column :styles, :m_1000, :decimal, precision: 16, scale: 2
    add_column :styles, :m_2000, :decimal, precision: 16, scale: 2
  end
end
