class KopisController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
    @roasts = Roast.all
    if request.query_parameters[:roastedness]
      roastedness = request.query_parameters[:roastedness]
      @kopis = Roast.find_by(id: roastedness).kopi
    else
      @kopis = Kopi.all
    end

  end

  def new
    @roasts = Roast.all
    @origins = Origin.all

    if params.has_key?(:origin_id)
      @kopi = Kopi.new
      @kopi.origin_id = params[:origin_id]
    end

  end

  def create
    @kopi = Kopi.new(kopi_params)
    @kopi.user = current_user
    @kopi.save

    redirect_to kopi_path(@kopi)
  end

  def show
    @kopi = Kopi.find(params[:id])
  end

  def edit
    @kopi = Kopi.find(params[:id])
    @kopi.user = current_user
    @roasts = Roast.all
    @origins = Origin.all
  end

  def update
    @kopi = Kopi.find(params[:id])
    @kopi.update(kopi_params)
    @kopi.save
    redirect_to kopi_path(@kopi)
  end

  def destroy
    @kopi = Kopi.find(params[:id])
    @kopi.destroy
    redirect_to kopis_path
  end

  private
    def kopi_params
      params.require(:kopi).permit(:name, :roast_id, :origin_id, :price)
    end
end
