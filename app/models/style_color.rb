class StyleColor < ActiveRecord::Base
  attr_accessible :shirt_color_id, :style_id

  belongs_to :shirt_color
  belongs_to :style
end
