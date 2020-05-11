class KopisController < ApplicationController
    
    before_action :authenticate_user!, :except => [ :show, :index ]

    def index
        @kopis = Kopi.all
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @kopis }
        end
    end
  
    def show
        @kopi = Kopi.find(params[:id])
    
        respond_to do |format|
          format.html
          format.json { render json: @kopi }
        end
    end
  
    def new
    @kopi = Kopi.new
    @roasts = Roast.all
    @origins = Origin.all
    end
  
    def edit
    end
  
    def create
    @kopi = Kopi.new(kopi_params)

    @kopi.user = current_user

    if @kopi.save
    redirect_to @kopi
        else
            render 'new'
        end
    end
  
    def update
    end
  
    def destroy
    end

    private
    def kopi_params
        params.require(:kopi).permit(:name, :origin_id, :roast_id)
    end

end
