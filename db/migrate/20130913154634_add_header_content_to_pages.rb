class AddHeaderContentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :header_content, :text
  end
end
