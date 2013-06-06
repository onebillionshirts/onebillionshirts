class Admins::StyleCategoriesController < Admins::HomeController
  before_filter :authenticate_admin!

  def index
    @style_categories = StyleCategory.all
  end

  def create
    @style_category = StyleCategory.new(params[:style_category])
    if @style_category.save
      flash[:notice] = "Style category created"
      redirect_to action: :index and return
    else
      render action: :new and return
    end
  end

  def new
    @style_category = StyleCategory.new
  end

  def destroy
    @style_category = StyleCategory.find(params[:id])
    @style_category.destroy if @style_category
    flash[:notice] = "Style category deleted"
    redirect_to action: :index
  end

  def edit
    @style_category = StyleCategory.find(params[:id])
  end

  def update
    @style_category = StyleCategory.find(params[:id])
    @style_category.update_attributes(params[:style_category]) if @style_category
    flash[:notice] = "Style Category updated"
    redirect_to action: :index
  end

end
