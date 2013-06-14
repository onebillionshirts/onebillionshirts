class MatrixCol < ActiveRecord::Base
  attr_accessible :c_1, :c_2, :c_3, :c_4, :c_5, :c_6, :matrix_id, :count
  belongs_to :cost_matrix, foreign_key: :matrix_id

  validates_numericality_of  :c_1
  validates_numericality_of  :c_2
  validates_numericality_of  :c_3
  validates_numericality_of  :c_4
  validates_numericality_of  :c_5
  validates_numericality_of  :c_6

end
