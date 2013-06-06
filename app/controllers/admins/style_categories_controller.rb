class Admins::StyleCategoriesController < Admins::HomeController
  before_filter :authenticate_admin!

  def index
    render json: "index"
  end

  def create

  end

  def new

  end

  def destroy

  end

  def edit

  end

  def update

  end

end
