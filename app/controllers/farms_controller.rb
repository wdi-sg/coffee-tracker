class FarmsController < ApplicationController

  def index

    @farm = Farm.all

  end

  def new
  end

  def create
    @farm = Farm.new(farm_params)

    @farm.save
    redirect_to @farm
  end

  def show
    @farm = Farm.find(params[:id])
  end

private

  def farm_params
    params.require(:farm).permit(:location, :phone_number)
  end

end