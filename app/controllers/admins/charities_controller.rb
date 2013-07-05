class Admins::CharitiesController < Admins::HomeController
  # GET /admins/charities
  # GET /admins/charities.json
  #
  
  def pending
    @charities = Charity.unscoped.where(approved: false)
  end

  def index
    @charities = Charity.find(:all, :order => "name")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charities }
    end
  end

  def approve
    @charity = Charity.unscoped.find_by_slug(params[:id])
    @charity.update_attribute(:approved, true)
    flash[:notice] = "Approved"
    redirect_to pending_admins_charities_path
  end

  # GET /admins/charities/1
  def show
    @charity = Charity.unscoped.find_by_slug(params[:id])

    respond_to do |format|
      format.html # _details.html.erb
      format.json { render json: @charity }
    end
  end

  # GET /admins/charities/new
  # GET /admins/charities/new.json
  def new
    @charity = Charity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charity }
    end
  end

  # GET /admins/charities/1/edit
  def edit
    @charity = Charity.unscoped.find(params[:id])
  end

  # POST /admins/charities
  # POST /admins/charities.json
  def create
    @charity = Charity.new(params[:charity])
    @charity.approved = true

    respond_to do |format|
      if @charity.save
        format.html { redirect_to admins_charities_url, notice: 'Charity was successfully created.' }
        format.json { render json: @charity, status: :created, location: @charity }
      else
        format.html { render action: "new" }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/charities/1
  # PUT /admins/charities/1.json
  def update
    @charity = Charity.unscoped.find(params[:id])
    if params[:charity][:is_default] == "1"
      c = Charity.find_by_is_default("1")
      c.update_attribute("is_default", nil) unless c.blank?
    end

    respond_to do |format|
      if @charity.update_attributes(params[:charity])
        format.html { redirect_to admins_charities_url, notice: 'Charity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/charities/1
  # DELETE /admins/charities/1.json
  def destroy
    @charity = Charity.unscoped.find(params[:id])
    @charity.destroy

    respond_to do |format|
      format.html { redirect_to admins_charities_url }
      format.json { head :no_content }
    end
  end


  def image_form
    render :json => {:html => render_to_string(:partial => "/admins/charities/images")}.to_json
  end

end
