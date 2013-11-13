class Admins::CostMatricesController < Admins::HomeController

  def show
    @mat = CostMatrix.default
  end

  def edit
    @mat = CostMatrix.default
  end

  def update
    params[:mc].each do |k,v|
      col = MatrixCol.find(k.to_i)
      unless col.update_attributes(v)
        flash[:notice] = "Some values failed to update because they were not decimal values"
      end
    end
    redirect_to action: :show
  end

  def new
  end

  def create
  end

end
