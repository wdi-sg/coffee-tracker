class CustomersController < ApplicationController

  # def index
  #   # test to see if we are at /parks/:id/rangers or /rangers
  #   if params.has_key?(:park_id)
  #     # get all the rangers for a specific park
  #     @rangers = Ranger.where(park_id: params[:park_id] )
  #   else
  #     # get all rangers
  #     @rangers = Ranger.all
  #   end
  # end
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @customers = Customer.all
    @cups = Cup.all
    if params[:customer] == '1'
      @customers = Customer.all.order("name asc")
    elsif params[:customer] == '2'
      @customers = Customer.all.order("name desc")
    elsif params[:customer] == '3'
      @customers = Customer.all.each do |customer|
        customer.sort_by{ |x,y| x.cups.length <=> y.cups.length }
      end
    elsif params[:customer] == '4'
      @customers = Customer.all.sort_by(&:length)
    end
  end

  def new
    @cups = Cup.all
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save
    redirect_to customers_path
  end

  def show
    @customer = Customer.find(params[:id])
  end

private

  def customer_params
    params.require(:customer).permit(:name, :phone, :cup_ids => [])
  end

end