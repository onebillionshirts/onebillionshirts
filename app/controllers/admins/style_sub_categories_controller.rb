class Admins::StyleSubCategoriesController < Admins::HomeController
  before_filter :authenticate_admin!

  def index
    @style_categories = StyleSubCategory.all
  end

  def create
    @style_sub_category = StyleSubCategory.new(params[:style_sub_category])
    if @style_sub_category.save
      flash[:notice] = "Style subcategory created"
      redirect_to action: :index and return
    else
      render action: :new and return
    end
  end

  def new
    @style_sub_category = StyleSubCategory.new
  end

  def destroy
    @style_sub_category = StyleSubCategory.find(params[:id])
    @style_sub_category.destroy if @style_sub_category
    flash[:notice] = "Style subcategory deleted"
    redirect_to action: :index
  end

  def edit
    @style_sub_category = StyleSubCategory.find(params[:id])
  end

  def update
    @style_sub_category = StyleSubCategory.find(params[:id])
    @style_sub_category.update_attributes(params[:style_sub_category]) if @style_sub_category
    flash[:notice] = "Style SubCategory updated"
    redirect_to action: :index
  end

end
