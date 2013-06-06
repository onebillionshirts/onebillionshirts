class Style < ActiveRecord::Base
  attr_accessible :name, :style_sub_category_id, :photo

  belongs_to :style_sub_category

  validates :name, presence: true
  validates :style_sub_category_id, presence: true

  has_attached_file :photo, styles: {thumb: "100x100>", medium: "250x250>"}

  def style_category
    self.style_sub_category.style_category
  end

end
