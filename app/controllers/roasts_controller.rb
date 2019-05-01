class RoastsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_roast, only: [:show, :edit, :update, :destroy]

  # GET /roasts
  # GET /roasts.json
  def index
    @roasts = Roast.find(current_user.id)
    p @roasts
  end

  # GET /roasts/1
  # GET /roasts/1.json
  def show
  end

  # GET /roasts/new
  def new
    @roast = Roast.new
  end

  # GET /roasts/1/edit
  def edit
  end

  # POST /roasts
  # POST /roasts.json
  def create
    @roast = Roast.new(roast_params)
    @roast.user = current_user

    respond_to do |format|
      if @roast.save
        format.html { redirect_to @roast, notice: 'Roast was successfully created.' }
        format.json { render :show, status: :created, location: @roast }
      else
        format.html { render :new }
        format.json { render json: @roast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roasts/1
  # PATCH/PUT /roasts/1.json
  def update
    respond_to do |format|
      if @roast.update(roast_params)
        format.html { redirect_to @roast, notice: 'Roast was successfully updated.' }
        format.json { render :show, status: :ok, location: @roast }
      else
        format.html { render :edit }
        format.json { render json: @roast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roasts/1
  # DELETE /roasts/1.json
  def destroy
    @roast.destroy
    respond_to do |format|
      format.html { redirect_to roasts_url, notice: 'Roast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roast
      @roast = Roast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roast_params
      params.require(:roast).permit(:name)
    end
end