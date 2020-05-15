class KopisController < ApplicationController

    def new
      @origins = Origin.all
      @roasts = Roast.all
    end
  
    def create
      @kopi = Kopi.new(kopi_params)
  
      @kopi.save
      redirect_to @kopi
    end
  
    def show
      # deal with the case that we are trying to get a kopi for a origin that doesn't exist
  
      @kopi = Kopi.find(params[:id])
  
      if params[:origin_id].to_i != @kopi.origin.id
        # do something
      end
    end

    def index
        # test to see if we are at /origins/:id/kopis or /kopis
        if params.has_key?(:origin_id)
          # get all the kopis for a specific origin
          @kopis = Kopi.where(origin_id: params[:origin_id] )
        else
          # get all kopis
          @kopis = Kopi.all
        end
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
      
      if params.has_key?(:origin_id)
        # get all the kopis for a specific origin
        @kopis = Kopi.where(origin_id: params[:origin_id] )
      else
        # get all kopis
        @kopis = Kopi.all
      end
    end
  
  private
  
    def kopi_params
      params.require(:kopi).permit(:name, :roast, :origin_id)
    end
  end