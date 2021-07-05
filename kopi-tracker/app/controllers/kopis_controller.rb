class KopisController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]


  def index
    @kopi = Kopi.all

  end

  def new
    @origins = Origin.all
    @roasts = Roast.all
  end

  def create
    @kopi = Kopi.new(kopi_params)
    @kopi.save
    @roasts = Roast.all
    @origins = Origin.all
    # redirect_to @kopi

          if @kopi.save
        redirect_to kopis_path
      else
        @kopi = Kopi.all
        render 'new'
      end

  end

  def show
    @kopi = Kopi.find(params[:id])
  end

  def edit
    @kopi = Kopi.find(params[:id])
    @origins = Origin.all
    @roasts = Roast.all
  end

  def update
    @kopi = Kopi.find(params[:id])
    @kopi.update(kopi_params)
    redirect_to @kopi
  end

  def destroy
    @kopi = Kopi.find(params[:id])
    @kopi.destroy
    redirect_to @kopi
  end


private

  def kopi_params
    params.require(:kopi).permit(:name, :roast_id, :origin_id)
  end

end