class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @kopis = Kopi.all
  end

  def new
    @kopis = Kopi.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @kopis = Kopi.all
      render "show"
    else
      @customers = Customer.all
      @kopis = Kopi.all
      render "new"
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:name, :kopi_ids => [])
  end
end
