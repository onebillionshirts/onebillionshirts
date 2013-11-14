class Customer < ActiveRecord::Base
  attr_accessible :charity_logo, :logo, :text, :charity_name, :charity_id

  belongs_to :charity

  has_attached_file :charity_logo, :styles => { :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90'}
  has_attached_file :logo, :styles => { :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90'}


end