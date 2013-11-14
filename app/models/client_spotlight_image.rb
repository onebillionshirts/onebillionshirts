class ClientSpotlightImage < ActiveRecord::Base

  attr_accessible :asset
  belongs_to :client_spotlight

  has_attached_file :asset, :styles => {:large => "500x400#", :slider => "200x200#", :medium => "250x250#", :thumb => "150x150#"}, :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :large => '-strip -interlace plane -quality 90'}


end

