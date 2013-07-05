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
    return 0 if (colors.to_i == 0)
    arr = self.quantities
    closest = arr.detect{|v| quan<v}
    i = arr.find_index(closest)
    unless i.nil?
      i = i - 1 unless i.zero?
    else
      i = arr.size - 1
    end
    final = arr[i]

    match = self.default.matrix_cols.find_by_count(final)
    match.send("c_#{colors}")
  end

  def self.more(num)
    self.quantities.select{|q| q>num}
  end

end
