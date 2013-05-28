class InkColorOption < ActiveRecord::Base

  attr_accessible :name, :side

  validates :name, :presence => true
  validates :side, :presence => true

  has_and_belongs_to_many :orders

  def self.back_options
    all.select { |option| option.side == "Back" }
  end

  def self.front_options
    all.select { |option| option.side == "Front" }
  end

end
