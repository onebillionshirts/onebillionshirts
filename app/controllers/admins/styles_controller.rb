class Admins::StylesController< Admins::HomeController
  before_filter :authenticate_admin!

  def index
    @styles = Style.all
  end

  def create
    @style = Style.new(params[:style])
    if @style.save
      flash[:notice] = "Style created"
      redirect_to action: :index and return
    else
      render action: :new and return
    end
  end

  def new
    @style = Style.new
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy if @style
    flash[:notice] = "Style deleted"
    redirect_to action: :index
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    @style.update_attributes(params[:style]) if @style
    flash[:notice] = "Style updated"
    redirect_to action: :index
  end

end
