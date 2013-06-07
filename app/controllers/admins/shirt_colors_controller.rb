class Admins::ShirtColorsController < Admins::HomeController
  # GET /admin/shirt_colors
  # GET /admin/shirt_colors.json
  def index
    @shirt_colors = ShirtColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirt_colors }
    end
  end

  # GET /admin/shirt_colors/new
  # GET /admin/shirt_colors/new.json
  def new
    @shirt_color = ShirtColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shirt_color }
    end
  end

  # GET /admin/shirt_colors/1/edit
  def edit
    @shirt_color = ShirtColor.find(params[:id])
  end

  # POST /admin/shirt_colors
  # POST /admin/shirt_colors.json
  def create
    @shirt_color = ShirtColor.new(params[:shirt_color])

    respond_to do |format|
      if @shirt_color.save
        format.html { redirect_to admins_shirt_colors_url, notice: 'Shirt color was successfully created.' }
        format.json { render json: @shirt_color, status: :created, location: @shirt_color }
      else
        format.html { render action: "new" }
        format.json { render json: @shirt_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/shirt_colors/1
  # PUT /admin/shirt_colors/1.json
  def update
    @shirt_color = ShirtColor.find(params[:id])

    respond_to do |format|
      if @shirt_color.update_attributes(params[:shirt_color])
        format.html { redirect_to admins_shirt_colors_url, notice: 'Shirt color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shirt_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shirt_colors/1
  # DELETE /admin/shirt_colors/1.json
  def destroy
    @shirt_color = ShirtColor.find(params[:id])
    @shirt_color.destroy

    respond_to do |format|
      format.html { redirect_to admins_shirt_colors_url }
      format.json { head :no_content }
    end
  end
end
