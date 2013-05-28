class OrderFile < ActiveRecord::Base

  attr_accessible :side, :image, :order_id

  has_attached_file :image, :styles => { :large => "500x400#", :medium => "250x250#", :thumb => "150x150#" }

  validates :image, :attachment_presence => true
  validates :side, :presence => true

  belongs_to :order

end
