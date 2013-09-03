class Admins::ContestsController < Admins::HomeController

  def index
   @contests = Contest.find(:all, :order => "title")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
  end

  def new
    @contest = Contest.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contest }
    end
  end

  def create
    @contest = Contest.new(params[:contest])

    respond_to do |format|
      if @contest.save
        format.html { redirect_to admins_contests_path, notice: 'Contest was successfully created.' }
        format.json { render json: @contest, status: :created, location: @contest }
      else
        format.html { render action: "new" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @contest = Contest.find(params[:id])
  end

  def update
    @contest = Contest.find(params[:id])

    respond_to do |format|
      if @contest.update_attributes(params[:contest])
        format.html { redirect_to admins_contests_path, notice: 'Contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to admins_contests_path , notice: 'Contest was deleted.'}
      format.json { head :no_content }
    end
  end

end
