class Charity < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :zip, :website, :tax_id, :mission_statement, :is_default, :twitter_id, :facebook_page,
                  :description, :video_url, :charity_category_id, :pictures_attributes, :logo_attributes, :is_featured, :is_top_ten


  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
  validates :mission_statement, :presence => true
  validates :charity_category, :presence => true

  belongs_to :charity_category
  has_many :orders
  has_one :logo
  has_many :pictures

  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :logo, :allow_destroy => true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.featured
    all.select { |charity| charity.is_featured == true }
  end

  def self.top_ten
    all.select { |charity| charity.is_top_ten == true }
  end

end
