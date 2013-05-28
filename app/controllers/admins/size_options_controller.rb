class Admins::SizeOptionsController < Admins::HomeController
  # GET /admin/size_options
  # GET /admin/size_options.json
  def index
    @size_options = SizeOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @size_options }
    end
  end

  # GET /admin/size_options/new
  # GET /admin/size_options/new.json
  def new
    @size_option = SizeOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @size_option }
    end
  end

  # GET /admin/size_options/1/edit
  def edit
    @size_option = SizeOption.find(params[:id])
  end

  # POST /admin/size_options
  # POST /admin/size_options.json
  def create
    @size_option = SizeOption.new(params[:size_option])

    respond_to do |format|
      if @size_option.save
        format.html { redirect_to admins_size_options_url, notice: 'Shirt size was successfully created.' }
        format.json { render json: @size_option, status: :created, location: @size_option }
      else
        format.html { render action: "new" }
        format.json { render json: @size_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/size_options/1
  # PUT /admin/size_options/1.json
  def update
    @size_option = SizeOption.find(params[:id])

    respond_to do |format|
      if @size_option.update_attributes(params[:size_option])
        format.html { redirect_to admins_size_options_url, notice: 'Shirt size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @size_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/size_options/1
  # DELETE /admin/size_options/1.json
  def destroy
    @size_option = SizeOption.find(params[:id])
    @size_option.destroy

    respond_to do |format|
      format.html { redirect_to admins_size_options_url }
      format.json { head :no_content }
    end
  end
end
