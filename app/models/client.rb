class Client < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :price_per_shirt, :zip, :reference_id

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :email, :format => /\A[^@]+@[^@]+\z/
  validates :price_per_shirt, :presence => true

  has_many :orders
  belongs_to :reference

end
