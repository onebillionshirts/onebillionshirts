class OrdersController < ApplicationController

  def quick_quote
    @charities = Charity.all
    @style_categories = StyleCategory.all
    @sub_cats = StyleSubCategory.all
  end

  def calculate
    style = Style.find(params[:style_id])
    if params[:style_color] == "0"
      price = style.price_white
    else
      price = style.price_color
    end

    quantity = params[:total].to_i

    profit_margin = style.per_by_quantity(quantity)

    front_ink_cost = CostMatrix.cost(params[:f_color], quantity)
    back_ink_cost = CostMatrix.cost(params[:b_color], quantity)

    #render json: {q: quantity, p: price, f: front_ink_cost, b: back_ink_cost, p_m: profit_margin, s: style} and return

    cost = (price + front_ink_cost + back_ink_cost + 0.25)/(1-(profit_margin/100.0))
    render json: {unit: cost.round(2), total: (cost*quantity).round(2)}
  end

end
