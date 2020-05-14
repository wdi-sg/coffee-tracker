class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    @kopi = Kopi.find(@order.kopi_id)
    puts "====================="
    puts @kopi.price_per_pound
    puts @order.weight
    @cost = @kopi.price_per_pound * @order.weight
  end

  def new
    @kopis = Kopi.all
  end

  def create
    @order = Order.new(order_params)

    @order.save
    redirect_to @order
  end

  def edit
  end

  def update
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:weight, :kopi_id)
  end
end