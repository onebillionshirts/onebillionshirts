class ClientSpotlight < ActiveRecord::Base
  attr_accessible :description, :name, :client_spotlight_type, :client_spotlight_images_attributes

  has_many :client_spotlight_images, :dependent => :destroy

  accepts_nested_attributes_for :client_spotlight_images, :allow_destroy => true
end
