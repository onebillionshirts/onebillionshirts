class Reference < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true

  has_one :client
end
