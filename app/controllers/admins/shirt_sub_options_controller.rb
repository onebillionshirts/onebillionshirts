class Admins::ShirtSubOptionsController < Admins::HomeController
  # GET /admin/shirt_sub_options
  # GET /admin/shirt_sub_options.json
  def index
    @shirt_sub_options = ShirtSubOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirt_sub_options }
    end
  end

  # GET /admin/shirt_sub_options/new
  # GET /admin/shirt_sub_options/new.json
  def new
    @shirt_sub_option = ShirtSubOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shirt_sub_option }
    end
  end

  # GET /admin/shirt_sub_options/1/edit
  def edit
    @shirt_sub_option = ShirtSubOption.find(params[:id])
  end

  # POST /admin/shirt_sub_options
  # POST /admin/shirt_sub_options.json
  def create
    @shirt_sub_option = ShirtSubOption.new(params[:shirt_sub_option])

    respond_to do |format|
      if @shirt_sub_option.save
        format.html { redirect_to admins_shirt_sub_options_url, notice: 'Shirt sub option was successfully created.' }
        format.json { render json: @shirt_sub_option, status: :created, location: @shirt_sub_option }
      else
        format.html { render action: "new" }
        format.json { render json: @shirt_sub_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/shirt_sub_options/1
  # PUT /admin/shirt_sub_options/1.json
  def update
    @shirt_sub_option = ShirtSubOption.find(params[:id])

    respond_to do |format|
      if @shirt_sub_option.update_attributes(params[:shirt_sub_option])
        format.html { redirect_to admins_shirt_sub_options_url, notice: 'Shirt sub option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shirt_sub_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shirt_sub_options/1
  # DELETE /admin/shirt_sub_options/1.json
  def destroy
    @shirt_sub_option = ShirtSubOption.find(params[:id])
    @shirt_sub_option.destroy

    respond_to do |format|
      format.html { redirect_to admins_shirt_sub_options_url }
      format.json { head :no_content }
    end
  end
end
