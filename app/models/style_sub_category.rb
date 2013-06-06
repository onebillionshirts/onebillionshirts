class StyleSubCategory < ActiveRecord::Base
  attr_accessible :name, :style_category_id

  belongs_to :style_category

  validates :name, presence: true
  validates :style_category_id, presence: true

  has_many :styles
end
