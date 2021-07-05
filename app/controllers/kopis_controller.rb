class KopisController < ApplicationController

before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @customers = Customer.all

    if request.query_parameters[:sort] === "desc"
      @kopis = Kopi.order(name: :desc)

    elsif request.query_parameters[:sort] === "asc"
      @kopis = Kopi.order(name: :asc)

    else
      @kopis = Kopi.all.order(params[:sort])

    end
  end

  def new
    @roasts = Roast.all
    @origins = Origin.all
    @customers = Customer.all
  end

  def create
    @kopi = Kopi.new(kopi_params)

    @kopi.save
    redirect_to @kopi
  end

  def show
    @kopi = Kopi.find(params[:id])
  end

  def edit
    @kopi = Kopi.find(params[:id])
    @roasts = Roast.all
    @origins = Origin.all
  end

  def update
    @kopi = Kopi.find(params[:id])

    @kopi.update(kopi_params)
    redirect_to @kopi
  end

  def destroy
    @kopi = Kopi.find(params[:id])
    @kopi.destroy

    redirect_to root_path
  end

  private
    def kopi_params
      params.require(:kopi).permit(:name, :roast_id, :origin_id, :customer_ids => [])
    end

end