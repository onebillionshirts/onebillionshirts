class OrderSizeValue < ActiveRecord::Base
  attr_accessible :value, :size_category_id, :size_option_id, :order_id

  belongs_to :order
  belongs_to :size_category
  belongs_to :size_option

end
