class Style < ActiveRecord::Base
  attr_accessible :name, :style_sub_category_id, :photo, :price_white, :price_color, :m_24, :m_48, :m_72, :m_144, :m_288, :m_576, :m_1000, :m_2000, :cost_level, :material


  belongs_to :style_sub_category

  validates :name, presence: true
  validates :style_sub_category_id, presence: true

  has_many :style_colors
  has_many :shirt_colors, through: :style_colors

  validates :price_white, presence: true
  validates :price_color, presence: true
  validates :m_24, presence: true
  validates :m_48, presence: true
  validates :m_72, presence: true
  validates :m_144, presence: true
  validates :m_288, presence: true
  validates :m_576, presence: true
  validates :m_1000, presence: true
  validates :m_2000, presence: true

  validates :price_white, numericality: true
  validates :price_color, numericality: true
  validates :m_24, numericality: true
  validates :m_48, numericality: true
  validates :m_72, numericality: true
  validates :m_144, numericality:  true
  validates :m_288, numericality:  true
  validates :m_576, numericality:  true
  validates :m_1000, numericality:  true
  validates :m_2000, numericality:  true

  validates :cost_level, numericality:  true
  

  has_attached_file :photo, styles: {thumb: "100x100>", medium: "250x250>"}

  def style_category
    self.style_sub_category.style_category
  end

  def per_by_quantity(num)
    arr = [24,48,72,144,288,576,1000,2000]
    closest = arr.detect{|v| num<v}
    i = arr.find_index(closest)
    unless i.nil?
      i = i - 1 unless i.zero?
    else
      i = arr.size - 1
    end
    final = arr[i]
    return self.send("m_#{final}".to_sym)
  end

end
