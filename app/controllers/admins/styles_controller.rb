class Admins::StylesController< Admins::HomeController
  before_filter :authenticate_admin!

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def create
    @style = Style.new(params[:style])
    if @style.save
      params[:color_ids].split(",").each do |id|
        if ShirtColor.exists?(id: id.to_i)
          StyleColor.create(shirt_color_id: id, style_id: @style.id)
        end
      end
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
    if @style
      @style.update_attributes(params[:style])
      @style.style_colors.destroy_all
      params[:color_ids].split(",").each do |id|
        if ShirtColor.exists?(id: id.to_i)
          StyleColor.create(shirt_color_id: id, style_id: @style.id)
        end
      end
    end
    flash[:notice] = "Style updated"
    redirect_to action: :index
  end

end
