class Admins::OrdersController < Admins::HomeController
  # GET /admins/orders
  # GET /admins/orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /admins/orders/1
  # GET /admins/orders/1.json
  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html # _details.html.erb
      format.json { render json: @order }
    end
  end

  # DELETE /admins/orders/1
  # DELETE /admins/orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admins_orders_url }
      format.json { head :no_content }
    end
  end
end
