class ShirtColor < ActiveRecord::Base
  attr_accessible :code, :name
  validates :code, :presence => true


  has_many :orders

  def white?
    self.code == "ffffff"
  end

end
