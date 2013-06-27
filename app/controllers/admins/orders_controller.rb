class Admins::OrdersController < Admins::HomeController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy if @order
    redirect_to action: :index
  end

end
