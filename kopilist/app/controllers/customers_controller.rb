class CustomersController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

  def new
    @koopis = Koopi.all
  end


  def create
    @customer = Customer.new(customer_params)
    @koopi.user_id = current_user.id
    @customer.save
    redirect_to customers_path
  end


  def show
    @customer = Customer.find(params[:id])
  end


  def edit
    @customer = Customer.find(params[:id])
  end


  def index
    # @customers = Customer.all
    # if params.has_key?(:koopi_id)
    #   @customers = Customer.where(:koopi_ids => params[:koopi_id] )
    # else
      @customers = Customer.all
    # end
  end


private

  def customer_params
    params.require(:customer).permit(:name,:koopi_ids => [])
  end

end

