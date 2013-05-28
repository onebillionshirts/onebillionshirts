class SizeCategory < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true

  has_many :order_size_values

end
