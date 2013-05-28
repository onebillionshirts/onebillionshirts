class Admins::CharityCategoriesController < Admins::HomeController
  # GET /admins/charity_categories
  # GET /admins/charity_categories.json
  def index
    @charity_categories = CharityCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charity_categories }
    end
  end

  # GET /admins/charity_categories/new
  # GET /admins/charity_categories/new.json
  def new
    @charity_category = CharityCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charity_category }
    end
  end

  # GET /admins/charity_categories/1/edit
  def edit
    @charity_category = CharityCategory.find(params[:id])
  end

  # POST /admins/charity_categories
  # POST /admins/charity_categories.json
  def create
    @charity_category = CharityCategory.new(params[:charity_category])

    respond_to do |format|
      if @charity_category.save
        format.html { redirect_to admins_charity_categories_url, notice: 'Charity Category was successfully created.' }
        format.json { render json: @charity_category, status: :created, location: @charity_category }
      else
        format.html { render action: "new" }
        format.json { render json: @charity_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/charity_categories/1
  # PUT /admins/charity_categories/1.json
  def update
    @charity_category = CharityCategory.find(params[:id])

    respond_to do |format|
      if @charity_category.update_attributes(params[:charity_category])
        format.html { redirect_to admins_charity_categories_url, notice: 'Charity Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charity_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/charity_categories/1
  # DELETE /admins/charity_categories/1.json
  def destroy
    @charity_category = CharityCategory.find(params[:id])
    @charity_category.destroy

    respond_to do |format|
      format.html { redirect_to admins_charity_categories_url }
      format.json { head :no_content }
    end
  end
end
