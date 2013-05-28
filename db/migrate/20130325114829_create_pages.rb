class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
       t.string :page_name
       t.text :page_content
      t.timestamps
    end

    Page.create!(:page_name => "about")
    Page.create!(:page_name => "ccc")
    Page.create!(:page_name => "how_it_works")
    Page.create!(:page_name => "our_story")
    Page.create!(:page_name => "top_ten_reasons")
  end
end
