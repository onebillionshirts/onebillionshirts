class Order < ActiveRecord::Base
  attr_accessible :b_c, :charity_id, :email, :f_c, :n_l, :n_m, :n_s, :n_xl, :n_xxl, :name, :quantity, :shirt_color_id, :style_id,
                  :phone, :zip, :reference_id, :later, :instructions

  after_create :send_admin_email

  belongs_to :charity
  belongs_to :style
  belongs_to :shirt_color
  belongs_to :reference

  has_attached_file :front_art
  has_attached_file :back_art


  def send_admin_email
    ObsMailer.order_mail_admin(self).deliver
  end

end
