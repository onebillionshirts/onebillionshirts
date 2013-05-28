class CharityImage < ActiveRecord::Base
  attr_accessible :image, :charity_id, :is_logo

  has_attached_file :image, :styles => { :large => "500x400#", :slider => "200x200#", :medium => "250x250#", :thumb => "150x150#" }

  belongs_to :charity

  before_save :check_image

  def check_image
    self.image = File.new("app/assets/images/no_logo.jpg") unless image.present?
  end

end
