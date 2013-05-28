class Admins::ClientSpotlightsController < Admins::HomeController
# GET /client_spotlights
# GET /client_spotlights.json
  def index
    @client_spotlights = ClientSpotlight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_spotlights }
    end
  end

  # GET /client_spotlights/1
  # GET /client_spotlights/1.json
  def show

    @client_spotlight = ClientSpotlight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_spotlight }
    end
  end

  # GET /client_spotlights/new
  # GET /client_spotlights/new.json
  def new
    @client_spotlight = ClientSpotlight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_spotlight }
    end
  end

  # GET /client_spotlights/1/edit
  def edit
    @client_spotlight = ClientSpotlight.find(params[:id])
  end

  # POST /client_spotlights
  # POST /client_spotlights.json
  def create
    @client_spotlight = ClientSpotlight.new(params[:client_spotlight])
    respond_to do |format|
      if @client_spotlight.save

        format.html { redirect_to admins_client_spotlights_url, notice: 'Client spotlight was successfully created.' }
        format.json { render json: @client_spotlight, status: :created, location: @client_spotlight }
      else

        format.html { render action: "new" }
        format.json { render json: @client_spotlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_spotlights/1
  # PUT /client_spotlights/1.json
  def update
    @client_spotlight = ClientSpotlight.find(params[:id])
    respond_to do |format|
      if @client_spotlight.update_attributes(params[:client_spotlight])
        format.html { redirect_to admins_client_spotlights_path, notice: 'Client spotlight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_spotlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_spotlights/1
  # DELETE /client_spotlights/1.json
  def destroy
    @client_spotlight = ClientSpotlight.find(params[:id])
    @client_spotlight.destroy

    respond_to do |format|
      format.html { redirect_to admins_client_spotlights_url }
      format.json { head :no_content }
    end
  end
end
