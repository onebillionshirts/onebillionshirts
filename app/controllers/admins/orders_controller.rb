class Admins::OrdersController < Admins::HomeController

  def index
    @orders = Order.all
  end

end
