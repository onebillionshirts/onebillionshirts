class Order < ActiveRecord::Base

  attr_accessible :created_at,:charity_id, :quantity, :client_id,:shirt_color_name,
                  :shirt_option_id, :shirt_sub_option_id, :shirt_color_id, :instructions, :estimated_total_shirts, :deadline, :other_shirt_option

  belongs_to :charity
  belongs_to :shirt_option
  belongs_to :shirt_sub_option
  belongs_to :shirt_color
  belongs_to :client

  has_many :order_size_values
  has_many :order_files
  has_and_belongs_to_many :ink_color_options

end
