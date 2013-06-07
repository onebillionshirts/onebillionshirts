class ShirtColor < ActiveRecord::Base
  attr_accessible :code, :name
  validates :code, :presence => true


  has_many :orders

end
