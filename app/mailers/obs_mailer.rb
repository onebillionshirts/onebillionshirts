class ObsMailer < ActionMailer::Base

  default from: "info@onebillionshirts.org"

  def send_inquiry(params)
    @name    = params[:name]
    @company = params[:company]
    @phone   = params[:phone]
    @inquiry = params[:inquiry]
    mail(:to => "info@onebillionshirts.org", :subject => "Contact Form Submission - OneBillionShirts.org", :from => params[:email])
  end

  def order_complete(order)
    @order = order
    mail(:to => order.client.email, :subject => "Successful Order Submission - OneBillionShirts.org")
  end

  def order_mail_admin(order)
    @order = order
    mail(:to => "info@onebillionshirts.org", :subject => "NEW ORDER - OneBillionShirts.org")
  end

end
