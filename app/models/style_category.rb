class StyleCategory < ActiveRecord::Base
  attr_accessible :name, :photo

  has_attached_file :photo, styles: {thumb: "100x100>", medium: "250x250>"}

  has_many :style_sub_categories
  has_many :styles, through: :style_sub_categories
end
