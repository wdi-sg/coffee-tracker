class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customers = Customer.all
    @kopis = Kopi.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
   @customer = Customer.new(customer_params)

    result = @customer.save()

    # diagnose the failure of the insert query
    if result == true

      redirect_to @customer
    else
      render plain: @customer.errors.inspect
    end
  end

    def update
    @customer = Customer.find(params[:id])

    @customer.update(customer_params)
    redirect_to @customer
  end


  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :kopi_ids => [])
    end

end
