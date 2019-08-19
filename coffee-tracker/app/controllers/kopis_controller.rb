class KopisController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @kopis = Kopi.all.order(:name)
  end

  def new
    @roasts = Roast.all
    @origins = Origin.all
  end

  def create
    # render plain: params[:post].inspect
    @kopi = Kopi.new(kopi_params)

    @kopi.user = current_user

    if @kopi.save
      redirect_to @kopi
    else
      render 'new'
    end
  end

  def show
    @kopi = Kopi.find(params[:id])

  end

  def edit
    @kopi = Kopi.find(params[:id])
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
    params.require(:kopi).permit(:name, :roast_id, :origin_id)

  end

end