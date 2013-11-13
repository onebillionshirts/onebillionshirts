class Admins::ColorGroupsController < Admins::HomeController
    # GET /admins/charity_categories
    # GET /admins/charity_categories.json
    def index
      @color_groups = ColorGroup.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @color_groups }
      end
    end

    # GET /admins/charity_categories/new
    # GET /admins/charity_categories/new.json
    def new
      @color_group = ColorGroup.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @color_group }
      end
    end

    # GET /admins/charity_categories/1/edit
    def edit
      @color_group = ColorGroup.find(params[:id])
    end

    # POST /admins/charity_categories
    # POST /admins/charity_categories.json
    def create
      @color_group = ColorGroup.new(params[:color_group])

      respond_to do |format|
        if @color_group.save
          format.html { redirect_to admins_color_groups_url, notice: 'Color Group was successfully created.' }
          format.json { render json: @color_group, status: :created, location: @color_group }
        else
          format.html { render action: "new" }
          format.json { render json: @color_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /admins/charity_categories/1
    # PUT /admins/charity_categories/1.json
    def update
      @color_group = ColorGroup.find(params[:id])

      respond_to do |format|
        if @color_group.update_attributes(params[:color_group])
          format.html { redirect_to admins_color_groups_url, notice: 'Group Color was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @color_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admins/charity_categories/1
    # DELETE /admins/charity_categories/1.json
    def destroy
      @color_group = ColorGroup.find(params[:id])
      @color_group.destroy

      respond_to do |format|
        format.html { redirect_to admins_color_groups_url }
        format.json { head :no_content }
      end
    end
end
