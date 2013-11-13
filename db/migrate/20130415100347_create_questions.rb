class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :answer
      t.integer :questions_category_id

      t.timestamps
    end
  end
end
