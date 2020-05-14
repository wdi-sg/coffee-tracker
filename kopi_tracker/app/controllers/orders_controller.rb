class OrdersController < ApplicationController
  def index
    @orders = Order.all.order_list(params[:sort_by])
  end

  def new
    @kopis = Kopi.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    redirect_to @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:weight, :kopi_id)
    end
end