class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.text :name
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :website
      t.text :tax_id
      t.text :mission_statement
      t.text :description
      t.text :video_url
      t.integer :charity_category_id
      t.boolean :is_featured
      t.boolean :is_top_ten
      t.text :twitter_id
      t.text :facebook_page

      t.timestamps
    end
  end
end
