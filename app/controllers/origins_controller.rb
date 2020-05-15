class OriginsController < ApplicationController
    before_action :authenticate_user!, :except => [ :show, :index ]

    def index
      @origins = Origin.all.order(:location)
    end
  
    def show
    end
  
    def new
    end
  
    def edit
      @origin = Origin.find(params[:id])
    end
  
    def create
      @origin = Origin.new(origin_params)
  
      @origin.save
      redirect_to origins_path
    end
  
    def update
      @origin = Origin.find(params[:id])
      
      @origin.update(origin_params)
      redirect_to origins_path
    end
  
    def destroy
      @origin = Origin.find(params[:id])
      @origin.destroy
    
      redirect_to origins_path
    end
    private
  
    def origin_params
    params.require(:origin).permit(:location, :phone)
    end
  end
