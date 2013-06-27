class Order < ActiveRecord::Base
  attr_accessible :b_c, :charity_id, :email, :f_c, :n_l, :n_m, :n_s, :n_xl, :n_xxl, :name, :quantity, :shirt_color_id, :style_id

  belongs_to :charity
  belongs_to :style
  belongs_to :shirt_color

  has_attached_file :front_art
  has_attached_file :back_art
end
