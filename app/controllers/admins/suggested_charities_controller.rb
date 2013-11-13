class Admins::SuggestedCharitiesController < Admins::HomeController

  def index
      @suggested_charities = SuggestedCharity.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @suggested_charities }
      end
    end


    # DELETE /admin/shirt_options/1
    # DELETE /admin/shirt_options/1.json
    def destroy
      @suggested_charity = SuggestedCharity.find(params[:id])
      @suggested_charity.destroy

      respond_to do |format|
        format.html { redirect_to admins_suggested_charities_url }
        format.json { head :no_content }
      end
    end

end
