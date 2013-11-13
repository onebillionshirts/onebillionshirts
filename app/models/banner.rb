class Banner < ActiveRecord::Base
  attr_accessible :content, :image
  has_attached_file :image, :styles => { :medium => "300x200>", :thumb => "100x100>" }

  validates :content, :presence => true
  validates :image, :attachment_presence => true

end
