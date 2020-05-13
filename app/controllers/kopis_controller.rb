class KopisController < ApplicationController
  before_action :authenticate_user!, :except => [ :index ]


  def index
     @kopi = Kopi.all

     id = current_user.id
     @kopi = Kopi.where(user_id: id)
  end

  def show
     @kopi = Kopi.find(params[:id])
  end

  def new
     @roasts = Roast.all
     @origins = Origin.all
     @customers = Customer.all
   end

  def create
    #render plain: params[:kopi].inspect
    @kopi = Kopi.new(kopi_params)
    #@roast.kopi = Kopi.where(roast_id: @roast.id )
    @kopi.user_id = current_user.id
    result = @kopi.save()
    #redirect_to @kopi


    # diagnose the faliure of the insert query
    if result == true

      redirect_to @kopi
    else
      render plain: @kopi.errors.inspect

   end
  end

   private
    def kopi_params
      params.require(:kopi).permit(:name, :origin_id, :roast_id, :user_id, :customer_ids =>[])
    end

end