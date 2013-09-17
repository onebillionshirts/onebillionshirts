class Customer < ActiveRecord::Base
  attr_accessible :main_logo, :logo, :text, :charity_name

  has_attached_file :main_logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :logo, :styles => { :medium => "250x250>", :thumb => "250x250>" }, :default_url => "/images/:style/missing.png"


end