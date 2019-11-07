class CustomersController < ApplicationController
  # before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, :except => [ :show, :index ]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order("name ASC")
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @kopis = Kopi.all.order("name ASC")
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    @kopis = Kopi.all.order("name ASC")
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @kopis = Kopi.all.order("name ASC")
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :kopi_ids => [])
    end
end