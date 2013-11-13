class Contest < ActiveRecord::Base
  attr_accessible :end_date, :start_date, :title, :contest_entries_attributes


  validates :end_date, :presence => true
  validates :title, :presence => true


  extend FriendlyId
  friendly_id :title, use: :slugged


  has_many :contest_entries, :dependent => :destroy
  accepts_nested_attributes_for :contest_entries


end
