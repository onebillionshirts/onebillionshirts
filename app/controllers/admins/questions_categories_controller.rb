class Admins::QuestionsCategoriesController < Admins::HomeController
  # GET /questions_categories
  # GET /questions_categories.json
  def index
    @questions_categories = QuestionsCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions_categories }
    end
  end

  # GET /questions_categories/1
  # GET /questions_categories/1.json
  def show
    @questions_category = QuestionsCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questions_category }
    end
  end

  # GET /questions_categories/new
  # GET /questions_categories/new.json
  def new
    @questions_category = QuestionsCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questions_category }
    end
  end

  # GET /questions_categories/1/edit
  def edit
    @questions_category = QuestionsCategory.find(params[:id])
  end

  # POST /questions_categories
  # POST /questions_categories.json
  def create
    @questions_category = QuestionsCategory.new(params[:questions_category])

    respond_to do |format|
      if @questions_category.save
        format.html {redirect_to admins_questions_categories_url, notice: 'Questions category was successfully created.' }
        format.json { render json: @questions_category, status: :created, location: @questions_category }
      else
        format.html { render action: "new" }
        format.json { render json: @questions_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions_categories/1
  # PUT /questions_categories/1.json
  def update
    @questions_category = QuestionsCategory.find(params[:id])

    respond_to do |format|
      if @questions_category.update_attributes(params[:questions_category])
        format.html { redirect_to admins_questions_categories_path, notice: 'Questions category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questions_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions_categories/1
  # DELETE /questions_categories/1.json
  def destroy
    @questions_category = QuestionsCategory.find(params[:id])
    @questions_category.destroy

    respond_to do |format|
      format.html { redirect_to admins_questions_categories_path }
      format.json { head :no_content }
    end
  end
end
