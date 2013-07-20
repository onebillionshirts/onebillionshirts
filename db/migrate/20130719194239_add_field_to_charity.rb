class AddFieldToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :your_name, :string
    add_column :charities, :your_email, :string
    add_column :charities, :your_phone, :string

  end
end
