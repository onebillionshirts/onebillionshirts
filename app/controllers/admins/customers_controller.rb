class Admins::CustomersController < Admins::HomeController

  def index
    @customers = Customer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  def new
    @customer = Customer.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to admins_customers_path, notice: 'customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to admins_customers_path, notice: 'customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to admins_customers_path , notice: 'customer was deleted.'}
      format.json { head :no_content }
    end
  end

end
