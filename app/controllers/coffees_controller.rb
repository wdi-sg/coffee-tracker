class CoffeesController < ApplicationController
  def index
    # @coffees = Coffee.all
    # if params.has_key?(:id)
    #   # get all the rangers for a specific park
    #   @coffees = Coffee.where(id: params[:id] )
    # else
      # get all rangers
      @coffees = Coffee.all
    # end
  end

  def show
     # @coffees = Coffee.where(id: params[:id] )
    @coffee = Coffee.find(params[:id])
  end

  def new
    @origins = Origin.all
  end

  def edit
    @coffee = Coffee.find(params[:id])
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.save
    redirect_to root_path
  end

  def update
    @coffee = Coffee.find(params[:id])

    @coffee.update(coffee_params)
    redirect_to @coffee
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy

    redirect_to root_path
  end

  private
  def coffee_params
    params.require(:coffee).permit(:name, :roast, :origin_id, :price)
  end
end