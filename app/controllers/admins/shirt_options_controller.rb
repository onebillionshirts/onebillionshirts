class Admins::ShirtOptionsController < Admins::HomeController
  # GET /admin/shirt_options
  # GET /admin/shirt_options.json
  def index
    @shirt_options = ShirtOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirt_options }
    end
  end

  # GET /admin/shirt_options/new
  # GET /admin/shirt_options/new.json
  def new
    @shirt_option = ShirtOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shirt_option }
    end
  end

  # GET /admin/shirt_options/1/edit
  def edit
    @shirt_option = ShirtOption.find(params[:id])
  end

  # POST /admin/shirt_options
  # POST /admin/shirt_options.json
  def create
    @shirt_option = ShirtOption.new(params[:shirt_option])

    respond_to do |format|
      if @shirt_option.save
        format.html { redirect_to admins_shirt_options_url, notice: 'Shirt option was successfully created.' }
        format.json { render json: @shirt_option, status: :created, location: @shirt_option }
      else
        format.html { render action: "new" }
        format.json { render json: @shirt_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/shirt_options/1
  # PUT /admin/shirt_options/1.json
  def update
    @shirt_option = ShirtOption.find(params[:id])

    respond_to do |format|
      if @shirt_option.update_attributes(params[:shirt_option])
        format.html { redirect_to admins_shirt_options_url, notice: 'Shirt option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shirt_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shirt_options/1
  # DELETE /admin/shirt_options/1.json
  def destroy
    @shirt_option = ShirtOption.find(params[:id])
    @shirt_option.destroy

    respond_to do |format|
      format.html { redirect_to admins_shirt_options_url }
      format.json { head :no_content }
    end
  end
end
