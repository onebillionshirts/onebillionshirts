class CostMatrix < ActiveRecord::Base
  attr_accessible :name

  has_many :matrix_cols, foreign_key: :matrix_id

  def self.default
    CostMatrix.first
  end

  def self.quantities
    [24,48,72,144,288,576,1000,2000]
  end

  def self.cost(colors, quan)
    closest = self.quantities.min_by{|v| (v-quan).abs}
    match = self.default.matrix_cols.find_by_count(closest)
    match.send("c_#{colors}")
  end

  def self.more(num)
    self.quantities.select{|q| q>num}
  end

end
