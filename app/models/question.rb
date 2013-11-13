class Question < ActiveRecord::Base
  belongs_to :questions_category
  attr_accessible :answer, :question, :questions_category_id

end
