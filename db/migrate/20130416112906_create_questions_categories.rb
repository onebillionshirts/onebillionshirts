class CreateQuestionsCategories < ActiveRecord::Migration
  def change
    create_table :questions_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
