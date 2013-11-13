class ContestEntry < ActiveRecord::Base
  attr_accessible :description, :title, :image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  has_many :votes, :dependent => :destroy
  belongs_to :contest
end
