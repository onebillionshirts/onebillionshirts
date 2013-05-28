class Admins::SizeCategoriesController < Admins::HomeController
  # GET /admin/size_categories
  # GET /admin/size_categories.json
  def index
    @size_categories = SizeCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @size_categories }
    end
  end

  # GET /admin/size_categories/new
  # GET /admin/size_categories/new.json
  def new
    @size_category = SizeCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @size_category }
    end
  end

  # GET /admin/size_categories/1/edit
  def edit
    @size_category = SizeCategory.find(params[:id])
  end

  # POST /admin/size_categories
  # POST /admin/size_categories.json
  def create
    @size_category = SizeCategory.new(params[:size_category])

    respond_to do |format|
      if @size_category.save
        format.html { redirect_to admins_size_categories_url, notice: 'Shirt size was successfully created.' }
        format.json { render json: @size_category, status: :created, location: @size_category }
      else
        format.html { render action: "new" }
        format.json { render json: @size_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/size_categories/1
  # PUT /admin/size_categories/1.json
  def update
    @size_category = SizeCategory.find(params[:id])

    respond_to do |format|
      if @size_category.update_attributes(params[:size_category])
        format.html { redirect_to admins_size_categories_url, notice: 'Shirt size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @size_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/size_categories/1
  # DELETE /admin/size_categories/1.json
  def destroy
    @size_category = SizeCategory.find(params[:id])
    @size_category.destroy

    respond_to do |format|
      format.html { redirect_to admins_size_categories_url }
      format.json { head :no_content }
    end
  end
end
