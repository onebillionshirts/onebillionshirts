class Admins::ReferencesController < Admins::HomeController

  def index
    @references = Reference.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @references }
    end
  end

  def new
    @reference = Reference.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reference }
    end
  end

  def create
    #@reference = Reference.create(:name => params[:reference][:name])
    #redirect_to :action => 'index'
    @reference = Reference.new(params[:reference])

    respond_to do |format|
      if @reference.save
        format.html { redirect_to admins_references_url, notice: 'Reference was successfully created.' }
        format.json { render json: @reference, status: :created, location: @reference }
      else
        format.html { render action: "new" }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])

      respond_to do |format|
        if @reference.update_attributes(params[:reference])
          format.html { redirect_to admins_references_url, notice: 'Reference was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @reference.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    respond_to do |format|
         format.html { redirect_to admins_references_url, notice: 'Reference was successfully deleted.'  }
         format.json { head :no_content }
       end
  end

end
