class OrdersController < ApplicationController


  def thankyou

  end

  def create
    #render json: params
    order_params = JSON.parse(params[:extras])
    order_params.symbolize_keys![:order].symbolize_keys!
    order = Order.new(order_params[:order])
    order.front_art = params[:front_art]
    order.back_art = params[:back_art]
    order.save
    redirect_to action: :thankyou and return
  end

  def quick_quote
    @charities = Charity.all
    @style_categories = StyleCategory.all
    @sub_cats = StyleSubCategory.all
    @charity_id = params[:charity_id] || Charity.default.first.id
  end

  def calculate
    style = Style.find(params[:style_id])
    
    shirt_color = ShirtColor.find(params[:style_color])

    if shirt_color.white?
      price = style.price_white
    else
      price = style.price_color
    end

    quantity = params[:total].to_i

    profit_margin = style.per_by_quantity(quantity)

    front_ink_cost = CostMatrix.cost(params[:f_color], quantity)
    back_ink_cost = CostMatrix.cost(params[:b_color], quantity)

    more = CostMatrix.more(quantity)

    order_more = more.map do |m|
      f_c = CostMatrix.cost(params[:f_color], m)
      b_c = CostMatrix.cost(params[:b_color], m)
      p_marg = style.per_by_quantity(m)
      c = (price + f_c + b_c + 0.25)/(1-(p_marg/100.0))
      {num:m, unit: c.round(2), charity: m*0.25}
    end

    cost = (price + front_ink_cost + back_ink_cost + 0.25)/(1-(profit_margin/100.0))
    render json: {more: order_more, charity: quantity*0.25, unit: cost.round(2), total: (cost*quantity).round(2)}
  end

end
