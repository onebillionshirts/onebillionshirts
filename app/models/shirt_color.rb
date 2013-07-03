class ShirtColor < ActiveRecord::Base
  attr_accessible :code, :name, :color_group_id
  validates :code, :presence => true


  has_many :orders
  belongs_to :color_group

  def white?
    self.code == "ffffff"
  end

end
