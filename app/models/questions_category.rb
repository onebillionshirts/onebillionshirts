class QuestionsCategory < ActiveRecord::Base
  has_many :questions
  attr_accessible :category
end
