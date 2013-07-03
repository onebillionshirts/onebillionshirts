class ColorGroup < ActiveRecord::Base
  attr_accessible :name

  has_many :shirt_colors
  has_many :style
end
