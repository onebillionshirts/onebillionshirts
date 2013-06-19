class Order < ActiveRecord::Base
  attr_accessible :b_c, :charity_id, :email, :f_c, :n_l, :n_m, :n_s, :n_xl, :n_xxl, :name, :quantity, :style_color, :style_id

  belongs_to :charity
  belongs_to :style
end
