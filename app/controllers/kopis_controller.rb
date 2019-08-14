class KopisController < ApplicationController

    def new
        #@kopi = Kopi.new
        @origins = Origin.all
        @roasts = Roast.all
    end

  def create
    @kopi = Kopi.new(kopi_params)

    @kopi.save
    redirect_to @kopi
  end

  def show
    # deal with the case that we are trying to get a ranger for a park that doesn't exist

    @kopi = Kopi.find(params[:id])

    # if params[:origin_id].to_i != @kopi.origin.id
    #   # do something
    # end
  end

private

  def kopi_params
    params.require(:kopi).permit(:name, :roast_id, :origin_id)
  end
end