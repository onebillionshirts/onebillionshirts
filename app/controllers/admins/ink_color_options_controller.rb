class Admins::InkColorOptionsController < Admins::HomeController
  # GET /admin/ink_color_options
  # GET /admin/ink_color_options.json
  def index
    @ink_color_options = InkColorOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ink_color_options }
    end
  end

  # GET /admin/ink_color_options/new
  # GET /admin/ink_color_options/new.json
  def new
    @ink_color_option = InkColorOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ink_color_option }
    end
  end

  # GET /admin/ink_color_options/1/edit
  def edit
    @ink_color_option = InkColorOption.find(params[:id])
  end

  # POST /admin/ink_color_options
  # POST /admin/ink_color_options.json
  def create
    @ink_color_option = InkColorOption.new(params[:ink_color_option])

    respond_to do |format|
      if @ink_color_option.save
        format.html { redirect_to admins_ink_color_options_url, notice: 'Ink Color option was successfully created.' }
        format.json { render json: @ink_color_option, status: :created, location: @ink_color_option }
      else
        format.html { render action: "new" }
        format.json { render json: @ink_color_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/ink_color_options/1
  # PUT /admin/ink_color_options/1.json
  def update
    @ink_color_option = InkColorOption.find(params[:id])

    respond_to do |format|
      if @ink_color_option.update_attributes(params[:ink_color_option])
        format.html { redirect_to admins_ink_color_options_url, notice: 'Ink Color option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ink_color_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ink_color_options/1
  # DELETE /admin/ink_color_options/1.json
  def destroy
    @ink_color_option = InkColorOption.find(params[:id])
    @ink_color_option.destroy

    respond_to do |format|
      format.html { redirect_to admins_ink_color_options_url }
      format.json { head :no_content }
    end
  end
end
