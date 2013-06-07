class OrdersController < ApplicationController

  def quick_quote
    @charities = Charity.all
    @style_categories = StyleCategory.all
    @sub_cats = StyleSubCategory.all
  end

end
